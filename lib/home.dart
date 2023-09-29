import 'dart:convert';

import 'package:car_bulao/Api/Api.Helper.dart';
import 'package:car_bulao/SessionManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Api/Api.Network.dart';
import 'login.dart';
import 'model/MyProfileModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<MyProfileModel> _futureMyProfile;

  void initState() {
    // TODO: implement initState
    super.initState();
    _futureMyProfile = myProfile();
  }

  Future<MyProfileModel> myProfile() async {
    String userId = SessionManager.getUserId();
    Map<String, String> body = {'id': userId};
    return ApiHelper().getProfile(body);
  }

  bool isOneWayClicked = true;
  bool isRoundedWayClicked = false;
  bool oneWay = true;
  bool roundWay = false;
  bool isLoading = false;

  bool isPickFroAirportCliked = true;
  bool isDropFromAirportClicked = false;
  bool pickAirport = true;
  bool dropAirport = false;
  bool pickFromSearchbtn = true;
  bool dropAirSearchbtn = false;

  bool searchCarOneWay = true;
  bool searchCarRound = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay seletedTime = TimeOfDay.now();
  DateTime localDate = DateTime.now();
  TimeOfDay localTime = TimeOfDay.now();
  DateTime returnDateSelected = DateTime.now();
  TimeOfDay returntimeSelected = TimeOfDay.now();
  DateTime roundTripPickupdate = DateTime.now();
  TimeOfDay roundtripPickuptime = TimeOfDay.now();

  TextEditingController oneWayFromController = TextEditingController();
  TextEditingController oneWayToController = TextEditingController();
  TextEditingController oneWayPickUpController = TextEditingController();
  TextEditingController oneWayPickAtController = TextEditingController();

  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();

  TextEditingController roundTripPickUpcontroller = TextEditingController();
  TextEditingController roundTripPickAtController = TextEditingController();
  TextEditingController returnTimeControler = TextEditingController();
  TextEditingController returnDateControler = TextEditingController();

  TextEditingController localCityController = TextEditingController();
  TextEditingController localPackagController = TextEditingController();
  TextEditingController localPickUpController = TextEditingController();
  TextEditingController localPickAtController = TextEditingController();

  TextEditingController pickFromAirportController = TextEditingController();
  TextEditingController pickFromAirportDropController = TextEditingController();
  TextEditingController pickFromAirPickUpController = TextEditingController();
  TextEditingController pickFromAirPickAtController = TextEditingController();

  TextEditingController pickupCity = TextEditingController();
  TextEditingController dropAddress = TextEditingController();
  TextEditingController pickUpFromAirportController = TextEditingController();
  TextEditingController pickAtfromAirportController = TextEditingController();
  TextEditingController dropFromAirportPickUpAtController =
      TextEditingController();
  TextEditingController DropFromAirportPickUpController =
      TextEditingController();

  Future<void> dateSelect(BuildContext context, DateTime initialDate,
      DateTime selectedValue, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedValue) {
      setState(() {
        selectedValue = picked;
        controller.text = DateFormat('yyyy-MM-dd').format(selectedValue);
      });
    }
  }

  Future<void> timeSelect(BuildContext context, TimeOfDay initialTime,
      TimeOfDay selectedTime, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        controller.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff28a745),
          title: Text(
            'CarBulao',
            style: GoogleFonts.fahkwang(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'my_notification');
              },
              icon: Icon(Icons.notification_add),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              FutureBuilder<MyProfileModel>(
                future: _futureMyProfile,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Errors : ${snapshot.error.toString()}');
                  } else if (!snapshot.hasData) {
                    return Text('Data not available');
                  } else {
                    final profileData = snapshot.data?.editProfile;
                    return UserAccountsDrawerHeader(
                      onDetailsPressed: () {
                        Navigator.pushNamed(context, 'my_profile');
                      },
                      decoration: BoxDecoration(
                        color: Color(0xff28a745),
                      ),
                      accountName: Row(
                        children: [
                          Text(
                            profileData?.name.toString() ??
                                'Name not available',
                            style: GoogleFonts.fahkwang(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      accountEmail: Text(
                        profileData?.email.toString() ?? 'Email not available',
                        style: GoogleFonts.fahkwang(
                            fontWeight: FontWeight.normal, fontSize: 13),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.network(profileData?.img.toString() ?? ''),
                      ),
                    );
                  }
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Color(0xff28a745),
                  size: 20,
                ),
                title: const Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black38),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'home');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.history,
                  color: Color(0xff28a745),
                  size: 20,
                ),
                title: const Text(
                  'Booking History',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black38),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'history');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.payments_outlined,
                  color: Color(0xff28a745),
                  size: 20,
                ),
                title: const Text(
                  ' Fare & Payment ',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black38),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'fare_and_payment');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.percent_rounded,
                  color: Color(0xff28a745),
                  size: 20,
                ),
                title: const Text(
                  ' Offers ',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black38),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'offers');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.share,
                  color: Color(0xff28a745),
                  size: 20,
                ),
                title: const Text(
                  ' Refer & Earn ',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black38),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'refer_and_earn');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.fact_check,
                  color: Color(0xff28a745),
                  size: 20,
                ),
                title: const Text(
                  ' FAQ ',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black38),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'faq');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.description,
                  color: Color(0xff28a745),
                  size: 20,
                ),
                title: const Text(
                  ' About',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black38),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'about');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.privacy_tip,
                  color: Color(0xff28a745),
                  size: 20,
                ),
                title: const Text(
                  'Privacy',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black38),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'privacy');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.message_sharp,
                  color: Color(0xff28a745),
                  size: 20,
                ),
                title: const Text(
                  'Contact Us',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black38),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'contact_us');
                },
              ),
              Divider(),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  size: 20,
                  color: Color(0xff28a745),
                ),
                title: const Text(
                  'LogOut',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("LogOut"),
                        content: Text(
                          'Are you sure want to LogOut',
                          style: GoogleFonts.fahkwang(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.fahkwang(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.remove("email");
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                  (route) => false);
                              // Perform logout logic here
                            },
                            child: Text(
                              'Ok',
                              style: GoogleFonts.fahkwang(
                                  fontWeight: FontWeight.normal, fontSize: 15),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          // ... (Your drawer code)
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    child: TabBar(
                      indicatorColor: Color(0xff28a745),
                      indicatorWeight: 3,
                      labelColor: Color(0xff28a745),
                      tabs: [
                        Tab(
                            icon: Icon(Icons.calendar_month),
                            text: 'OutStation'),
                        Tab(
                            icon: Icon(Icons.location_on_rounded),
                            text: 'Local'),
                        Tab(icon: Icon(Icons.local_airport), text: 'Airport'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Content for the OutStation tab
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isOneWayClicked
                                          ? Color(0xff28a745)
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.elliptical(0, 5),
                                        ),
                                        side: BorderSide(
                                            color: Color(0xff28a745)),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isOneWayClicked = true;
                                        isRoundedWayClicked = false;
                                        oneWay = true;
                                        roundWay = false;
                                      });
                                    },
                                    child: Text(
                                      'ONE WAY',
                                      style: GoogleFonts.fahkwang(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: isOneWayClicked
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isRoundedWayClicked
                                          ? Color(0xff28a745)
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.elliptical(5, 0),
                                        ),
                                        side: BorderSide(
                                            color: Color(0xff28a745)),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isRoundedWayClicked = true;
                                        isOneWayClicked = false;
                                        roundWay = true;
                                        oneWay = false;
                                      });
                                    },
                                    child: Text(
                                      'ROUND TRIP',
                                      style: GoogleFonts.fahkwang(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: isRoundedWayClicked
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (oneWay)
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller: oneWayFromController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'FROM',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller: oneWayToController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'TO',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            enabled: true,
                                            controller: oneWayPickUpController,
                                            readOnly: true,
                                            onTap: () => dateSelect(
                                                context,
                                                selectedDate,
                                                selectedDate,
                                                oneWayPickUpController),
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.calendar_month),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'PICK UP',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            onTap: () => timeSelect(
                                                context,
                                                seletedTime,
                                                seletedTime,
                                                oneWayPickAtController),
                                            controller: oneWayPickAtController,
                                            readOnly: true,
                                            enabled: true,
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.watch_later),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'PICK AT',
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff28a745),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(8, 8))),
                                        ),
                                        onPressed: () {
                                          oneWayTrip();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            'Search Car',
                                            style: GoogleFonts.fahkwang(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (roundWay)
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller: from,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'FROM',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller: to,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'TO',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            enabled: true,
                                            controller:
                                                roundTripPickUpcontroller,
                                            onTap: () => dateSelect(
                                                context,
                                                roundTripPickupdate,
                                                roundTripPickupdate,
                                                roundTripPickUpcontroller),
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.calendar_month),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'PICK UP',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            enabled: true,
                                            readOnly: true,
                                            controller:
                                                roundTripPickAtController,
                                            onTap: () => timeSelect(
                                                context,
                                                returntimeSelected,
                                                returntimeSelected,
                                                roundTripPickAtController),
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.watch_later),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'PICK AT',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller: returnDateControler,
                                            onTap: () => dateSelect(
                                                context,
                                                returnDateSelected,
                                                returnDateSelected,
                                                returnDateControler),
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.calendar_month),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'RETURN',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller: returnTimeControler,
                                            onTap: () => timeSelect(
                                                context,
                                                roundtripPickuptime,
                                                roundtripPickuptime,
                                                returnTimeControler),
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.watch_later),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'RETURN AT',
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff28a745),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(8, 8))),
                                        ),
                                        onPressed: () {
                                          roundTrip();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            'Search Car',
                                            style: GoogleFonts.fahkwang(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    // Content for the Local tab
                    SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SizedBox(
                                      height: 45,
                                      child: TextField(
                                        controller: localCityController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff28a745)),
                                          ),
                                          labelText: 'CITY',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SizedBox(
                                      height: 45,
                                      child: TextField(
                                        controller: localPackagController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff28a745)),
                                          ),
                                          labelText: 'PACKAGE',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SizedBox(
                                      height: 45,
                                      child: TextField(
                                        controller: localPickUpController,
                                        readOnly: true,
                                        onTap: () => dateSelect(
                                            context,
                                            localDate,
                                            localDate,
                                            localPickUpController),
                                        decoration: InputDecoration(
                                          prefixIcon:
                                              Icon(Icons.calendar_month),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff28a745)),
                                          ),
                                          labelText: 'PICK UP',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SizedBox(
                                      height: 45,
                                      child: TextField(
                                        controller: localPickAtController,
                                        onTap: () => timeSelect(
                                            context,
                                            localTime,
                                            localTime,
                                            localPickAtController),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.watch_later),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff28a745)),
                                          ),
                                          labelText: 'PICK AT',
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff28a745),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(8, 8))),
                                    ),
                                    onPressed: () {
                                      local();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        'Search Car',
                                        style: GoogleFonts.fahkwang(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Content for the Airport tab
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isPickFroAirportCliked
                                          ? Color(0xff28a745)
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.elliptical(0, 5),
                                        ),
                                        side: BorderSide(
                                            color: Color(0xff28a745)),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isPickFroAirportCliked = true;
                                        isDropFromAirportClicked = false;
                                        pickAirport = true;
                                        dropAirport = false;
                                        pickFromSearchbtn = true;
                                        dropAirSearchbtn = false;
                                      });
                                    },
                                    child: Text(
                                      'Pick Up From',
                                      style: GoogleFonts.fahkwang(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: isPickFroAirportCliked
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isDropFromAirportClicked
                                          ? Color(0xff28a745)
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(5, 0)),
                                        side: BorderSide(
                                            color: Color(0xff28a745)),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isDropFromAirportClicked = true;
                                        isPickFroAirportCliked = false;
                                        dropAirport = true;
                                        pickAirport = false;
                                        pickFromSearchbtn = false;
                                        dropAirSearchbtn = true;
                                      });
                                    },
                                    child: Text(
                                      'Drop To Airport',
                                      style: GoogleFonts.fahkwang(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: isDropFromAirportClicked
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (pickAirport)
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller:
                                                pickFromAirportController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'PICK UP FROM',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller:
                                                pickFromAirportDropController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'DROP ADDRESS',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller:
                                                pickUpFromAirportController,
                                            readOnly: true,
                                            onTap: () => dateSelect(
                                                context,
                                                returnDateSelected,
                                                returnDateSelected,
                                                pickUpFromAirportController),
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.calendar_month),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'PICK UP',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller:
                                                pickAtfromAirportController,
                                            onTap: () => timeSelect(
                                                context,
                                                returntimeSelected,
                                                returntimeSelected,
                                                pickAtfromAirportController),
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.watch_later),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'PICK UP AT',
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff28a745),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(8, 8))),
                                        ),
                                        onPressed: () {
                                          pickFromAirport();
                                          //Navigator.pushNamed(context, 'search_car');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            'Search Car',
                                            style: GoogleFonts.fahkwang(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (dropAirport)
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller: pickupCity,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'PICK UP CITY',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller: dropAddress,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'DROP ADDRESS',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller:
                                                DropFromAirportPickUpController,
                                            readOnly: true,
                                            onTap: () => dateSelect(
                                                context,
                                                returnDateSelected,
                                                returnDateSelected,
                                                DropFromAirportPickUpController),
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.calendar_month),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'PICK UP',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller:
                                                dropFromAirportPickUpAtController,
                                            onTap: () => timeSelect(
                                                context,
                                                returntimeSelected,
                                                returntimeSelected,
                                                dropFromAirportPickUpAtController),
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.watch_later),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff28a745)),
                                              ),
                                              labelText: 'PICK UP AT',
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff28a745),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.elliptical(8, 8)),
                                          ),
                                        ),
                                        onPressed: () {
                                          dropToAirport();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            'Search Car',
                                            style: GoogleFonts.fahkwang(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void oneWayTrip() {
    String from = oneWayFromController.text;
    String to = oneWayToController.text;
    String pichUp = oneWayPickUpController.text;
    String pickAt = oneWayPickAtController.text;

    if (from.isEmpty) {
      message('Enter From  Location');
      return;
    }
    if (to.isEmpty) {
      message('Enter To  Location');
      return;
    }
    if (pichUp.isEmpty) {
      message('Enter Pick  Up Date');
      return;
    }
    if (pickAt.isEmpty) {
      message('Enter Pick At Time  Up Date');
      return;
    }

    setState(() {
      isLoading = true;
    });

    Map<String, String> body = {
      'from': from,
      'to': to,
      'pick_up_date': pichUp,
      'pick_up_time': pickAt,
    };

    ApiHelper().oneWay(body).then((value) {
      if (value.massage == "data found successful") {
        message("Searching Car");
        Navigator.pushNamed(context, 'search_car');
      } else {
        message(value.massage.toString());
      }
    });
  }

  void message(String str) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        str,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
    ));
  }

  void local() {
    String city = localCityController.text;
    String package = localPackagController.text;
    String pickUp = localPickUpController.text;
    String pickAt = localPickAtController.text;

    if (city.isEmpty) {
      message('Select City');
      return;
    }
    if (package.isEmpty) {
      message('Select Package');
      return;
    }
    if (pickUp.isEmpty) {
      message('Select PickUp Date');
      return;
    }
    if (pickAt.isEmpty) {
      message('Select PickAt Time');
      return;
    }

    Map<String, String> body = {
      'city': city,
      'package': package,
      'pick_up_date': pickUp,
      'pick_up_time': pickAt,
    };

    ApiHelper().local(body).then((value) {
      if (value.massage == "data found successful") {
        message('Serching Car...');
        Navigator.pushNamed(context, 'search_car');
      } else {
        message('Try again...');
      }
    });
  }

  void pickFromAirport() {
    String pickAdd = pickFromAirportController.text;
    String DroppAdd = pickFromAirportDropController.text;
    String pickup = pickUpFromAirportController.text;
    String pickat = pickAtfromAirportController.text;

    if (pickAdd.isEmpty) {
      message('Enter Pick Location');
      return;
    }
    if (DroppAdd.isEmpty) {
      message('Enter Drop Location');
      return;
    }
    if (pickup.isEmpty) {
      message('Select Pick UP DATE');
      return;
    }
    if (pickat.isEmpty) {
      message('Select Pick UP Time');
      return;
    }

    Map<String, String> body = {
      'from': pickAdd,
      'to': DroppAdd,
      'pick_up_date': pickup,
      'pick_up_time': pickat,
    };

    ApiHelper().pickFromAirport(body).then((value) {
      if (value.massage == "data found successful") {
        message("Searching Car...");
        Navigator.pushNamed(context, 'seach_car');
      } else {
        message("Try Again...");
        return;
      }
    });
  }

  void roundTrip() {
    String fromlocation = from.text;
    String tolocation = to.text;
    String roudTripPickUp = roundTripPickUpcontroller.text;
    String roundTripPickAt = roundTripPickAtController.text;
    String roundtripReturnDate = returnDateControler.text;
    String roundTripReturnTime = returnTimeControler.text;

    if (fromlocation.isEmpty) {
      message('Enter From Location');
      return;
    }
    if (tolocation.isEmpty) {
      message('Enter To Location');
      return;
    }
    if (roudTripPickUp.isEmpty) {
      message('Enter PickUp Date Location');
      return;
    }
    if (roundTripPickAt.isEmpty) {
      message('Enter PickUp Time Location');
      return;
    }
    if (roundtripReturnDate.isEmpty) {
      message('Enter Return Date ');
      return;
    }
    if (roundTripReturnTime.isEmpty) {
      message('Enter Return Time ');
      return;
    }

    Map<String, String> body = {
      "from": fromlocation,
      "to": tolocation,
      "pick_up_date": roudTripPickUp,
      "pick_up_time": roundTripPickAt,
      "return_date": roundtripReturnDate,
      "return_time": roundTripReturnTime,
    };
    ApiHelper().roundTripinsert(body).then((value) {
      if (value.massage == "data found successful") {
        message('Searching Car For Round Trip');
        Navigator.pushNamed(context, 'search_car');

        return;
      } else {
        message('try again...');
        return;
      }
    });
  }

  void dropToAirport() {
    String pickcity = pickupCity.text;
    String dropadd = dropAddress.text;
    String date = DropFromAirportPickUpController.text;
    String time = dropFromAirportPickUpAtController.text;

    if (pickcity.isEmpty) {
      message('Enter Pick Up City');
      return;
    }
    if (dropadd.isEmpty) {
      message('Enter Drop Address');
      return;
    }
    if (date.isEmpty) {
      message('Enter Pick Up Date');
      return;
    }
    if (time.isEmpty) {
      message('Enter Pick Up Time');
      return;
    }
    setState(() {
      isLoading = false;
    });

    Map<String, String> body = {
      "from": pickcity,
      "to": dropadd,
      "pick_up_date": date,
      "pick_up_time": time,
    };

    ApiHelper().dropToAirport(body).then((value) {
      if (value.massage == "data found successful") {
        message("Searching cars");
        Navigator.pushNamed(context, 'search_car');
      } else {
        message(value.massage.toString());
      }
    });
  }
}
