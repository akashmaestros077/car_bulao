import 'dart:io';

import 'package:car_bulao/booking.dart';
import 'package:car_bulao/drawer/about.dart';
import 'package:car_bulao/drawer/fare_and_payment.dart';
import 'package:car_bulao/drawer/my_notification.dart';
import 'package:car_bulao/drawer/my_profile.dart';
import 'package:car_bulao/drawer/offers.dart';
import 'package:car_bulao/drawer/refer_and_earn.dart';
import 'package:car_bulao/edit_profile.dart';
import 'package:car_bulao/forgot_password.dart';
import 'package:car_bulao/history.dart';
import 'package:car_bulao/login.dart';
import 'package:car_bulao/onboarding_screen.dart';
import 'package:car_bulao/pay_online.dart';
import 'package:car_bulao/drawer/privacy.dart';
import 'package:car_bulao/save_password.dart';
import 'package:car_bulao/search_car.dart';
import 'package:car_bulao/sign_up.dart';
import 'package:car_bulao/view_details.dart';
import 'package:flutter/material.dart';
import 'SessionManager.dart';
import 'drawer/contact_us.dart';
import 'drawer/faq.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.init();
  bool isLoggedIn = SessionManager.isLoggedIn();
  runApp(MyApp(isLoggedIn: isLoggedIn));
  HttpOverrides.global = MyHttpOverrides();

}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff28a745),
        ),
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: isLoggedIn ? Home() : Login(),
      routes: {
        'login': (context) => Login(),
        'home': (contex) => Home(),
        'sign_up': (context) => SignUp(),
        'contact_us': (context) => ContactUs(),
        'my_profile': (context) => MyProfile(),
        'fare_and_payment': (context) => FareAndPayment(),
        'offers': (context) => Offers(),
        'refer_and_earn': (context) => ReferAndEarn(),
        'faq': (context) => FAQ(),
        'search_car': (context) => SearchCar(),
        'booking': (context) => Booking(),
        'pay_online': (context) => PayOnline(),
        'history': (context) => History(),
        'view_details': (context) => ViewTicketDetails(),
        'privacy': (context) => Privacy(),
        'about': (context) => About(),
        'forgot_password': (context) => ForgotPassword(),
        'save_password': (context) => SavePassword(),
        'my_notification': (context) => MyNotification(),
        'edit_profile': (context) => EditProfile(),
        'onboarding_screen': (context) => OnboardingScreen(),
      },
    );
  }
}
