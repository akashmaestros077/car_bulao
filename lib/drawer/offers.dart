import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers',style: GoogleFonts.fahkwang(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
        ),
        ),
        iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: Color(0xff28a745),
      ),

    );
  }
}
