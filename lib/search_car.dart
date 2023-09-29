import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Api/Api.Network.dart';
import 'model/CarListModel.dart';

class SearchCar extends StatefulWidget {
  const SearchCar({Key? key}) : super(key: key);

  @override
  State<SearchCar> createState() => _SearchCarState();
}

class _SearchCarState extends State<SearchCar> {
  Future<CarListModel> carlist() async {
    Uri uri = Uri.parse(ApiNetwork.showcarlist);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return CarListModel.fromJson(jsonDecode(response.body));
      } else {
        return CarListModel(message: "Something went wrong");
      }
    } catch (e) {
      return CarListModel(message: "Something went wrong");
    }
  }

  late Future<CarListModel> _futureCarList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureCarList = carlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Car',
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
      ),
      body: Column(
        children: [
          // Search information container
          Container(
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blueGrey.shade50,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  // Search details row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Origin and destination
                      Row(
                        children: [
                          Text('Bhopal ',
                              style: GoogleFonts.fahkwang(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                          Text('To ',
                              style: GoogleFonts.fahkwang(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.blueGrey,
                              )),
                          Text('Delhi ',
                              style: GoogleFonts.fahkwang(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                        ],
                      ),
                      // Pick-up date
                      Column(
                        children: [
                          Text('Pick Up ',
                              style: GoogleFonts.fahkwang(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                          Text('2023-08-24',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.blueGrey,
                              )),
                        ],
                      ),
                      // Time
                      Column(
                        children: [
                          Text('Time ',
                              style: GoogleFonts.fahkwang(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                          Text('04:00:00',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.blueGrey,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // List of search results
          Expanded(
            child: FutureBuilder<CarListModel>(
                future: _futureCarList,
                builder: (BuildContext context,
                    AsyncSnapshot<CarListModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Return a loading indicator while fetching data
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    // Handle error case
                    return Text("Error: ${snapshot.error}");
                  } else {
                    final carList = snapshot.data?.data ?? [];
                    return ListView.builder(
                      itemCount: carList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final car = carList[index];
                        return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 10, left: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/Crysta 7+1.jpg',
                                          height: 125,
                                          width: 130,
                                        ),
                                        SizedBox(width: 15),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                car.name.toString(),
                                                // 'Innova Crysta\n(7+1 Seater)',
                                                style: GoogleFonts.fahkwang(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15,
                                                  color: Colors.black45,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "₹" + car.price.toString(),
                                                style: GoogleFonts.acme(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Color(0xff28a745),
                                                ),
                                              ),
                                              Text(
                                                'Up to' +
                                                    car.km.toString() +
                                                    "KM",
                                                style: GoogleFonts.fahkwang(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext contex) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      'Details & Rules',
                                                      style:
                                                          GoogleFonts.fahkwang(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    content: Text(
                                                      "1. Driver Night Charge - \n  Rs. 300 (10PM-6AM)\n2. Airport / Railway Station Parking \n  Will be extra \n3. Waiting Charge will be Rs. 2 / Min\n4. AC Will be Switched off in Hilly Areas ",
                                                      style:
                                                          GoogleFonts.fahkwang(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 13),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context); // Close the dialog

                                                          },
                                                          child: Text(
                                                            'Close',
                                                            style: GoogleFonts
                                                                .fahkwang(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        15),
                                                          )),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Text(
                                            'See Details\n& Rules',
                                            style: GoogleFonts.fahkwang(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/certified.png',
                                              height: 24,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Top Rated \ncabs & chauffeurs',
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10,
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/inclusive.png',
                                              height: 24,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Includes Toll, \nstate tax & GST',
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10,
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(height: 10),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xff28a745),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, 'booking');
                                              },
                                              child: Text(
                                                'Select',
                                                style: GoogleFonts.fahkwang(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
