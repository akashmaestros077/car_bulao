import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs',style: GoogleFonts.fahkwang(
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
