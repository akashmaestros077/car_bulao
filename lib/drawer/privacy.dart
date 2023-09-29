import 'package:car_bulao/Api/Api.Helper.dart';
import 'package:car_bulao/model/PrivacyModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy',
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: FutureBuilder<PrivacyModel>(
          future: ApiHelper().privacy(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasError){
              return Text("Erros ${ snapshot.error}");
            }
            else if(!snapshot.hasData){
              return Text("no data available");
            }
            else{
              final privacyData = snapshot.data!.privacyData;
              return Text(privacyData!.description.toString(),style: GoogleFonts.fahkwang(
                fontSize: 12,
              ),);

            }
          },
        ),
      ),
    );
  }
}
