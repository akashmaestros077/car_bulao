import 'dart:async';

import 'package:car_bulao/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),()=> Navigator.pushReplacement(
        context,MaterialPageRoute(builder:(context)=> Login())));
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(
                height:120,
          width: 120,
          child: Image.asset('assets/logo.png',))],
          ),
        ),

      ),
    );
  }
}
