import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200,width: double.infinity,
                child: Image.asset('assets/onb1.png')),

            Text('Tracking Realtime',style: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.green,
            ),),
            Text('We offer professional \ncar rental & limousine services in \nour range of high-end vehicles',style: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.green,

            ),),
          ],
        ),
      ),
    );
  }
}
