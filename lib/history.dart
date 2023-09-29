import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Api/Api.Network.dart';
import 'model/BookingHistoryModel.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late Future<BookingHistoryModel> _futureBookingHistory;

  @override
  void initState() {
    super.initState();
    history();
  }

  Future<BookingHistoryModel> bookinghistory(Map<String, dynamic> body) async {
    Uri uri = Uri.parse(ApiNetwork.bookingHistory);

    try {
      final response = await http.post(uri, body: body);
      if (response.statusCode == 200) {
        return BookingHistoryModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Something went wrong!!!');
      }
    } catch (e) {
      throw Exception('Something went wrong!!!');
    }
  }

  void history() {
    String userId = '1';

    Map<String, String> body = {
      'user_id': userId,
    };

    setState(() {
      _futureBookingHistory = bookinghistory(body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff28a745),
        title: Text(
          'History',
          style: GoogleFonts.fahkwang(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booked Ticket',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff28a745),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<BookingHistoryModel>(
                      future: _futureBookingHistory,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child:
                                  Text('Error: ${snapshot.error.toString()}'));
                        } else if (!snapshot.hasData) {
                          return Center(child: Text('No data available.'));
                        } else {
                          final bookingHistory = snapshot.data?.data ?? [];

                          return ListView.builder(
                              itemCount: snapshot.data?.data?.length,
                              itemBuilder: (BuildContext contex, int index) {
                                final ticket = bookingHistory[index];

                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(0, 0))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.elliptical(0, 0),
                                              ),
                                              color: Color(0xff28a745),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'TICKET',
                                                style:
                                                    GoogleFonts.palanquinDark(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.train_sharp,
                                                    color: Color(0xff28a745),
                                                  ),
                                                  Text(
                                                    ticket.from.toString() +
                                                        " ",
                                                    //  'BHOPAL  ',
                                                    style: GoogleFonts
                                                        .palanquinDark(
                                                            color: Color(
                                                                0xff28a745),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  Text(
                                                    'TO',
                                                    style: GoogleFonts
                                                        .palanquinDark(
                                                            color: Color(
                                                                0xff28a745),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  Text(
                                                    " " + ticket.to.toString(),
                                                    //  '  DEHLI',
                                                    style: GoogleFonts
                                                        .palanquinDark(
                                                            color: Color(
                                                                0xff28a745),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Name',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Akash ahirwar',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Mobile',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    '456546545645',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Pickup Date',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    '2023-08-24',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Ticket Fare',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    '₹26070',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xff28a745),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, 'view_details');
                                              },
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
