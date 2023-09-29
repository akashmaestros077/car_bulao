import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FareAndPayment extends StatefulWidget {
  const FareAndPayment({Key? key}) : super(key: key);

  @override
  State<FareAndPayment> createState() => _FareAndPaymentState();
}

class _FareAndPaymentState extends State<FareAndPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fares & Charges',style: GoogleFonts.fahkwang(
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
