import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About',style: GoogleFonts.fahkwang(
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
