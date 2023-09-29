import 'package:car_bulao/model/SignUpModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Api/Api.Helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center content vertically
                  children: [
                    SizedBox(
                        height: 100,
                        child: Image.asset('assets/logo.png',
                            height: 100, width: 100)),
                    SizedBox(
                      height: 50,
                      child: Text(
                        'SIGN UP',
                        style: GoogleFonts.fahkwang(

                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8)),
                            borderSide: BorderSide(color: Color(0xff28a745)),
                          ),
                          labelText: 'Name',
                          prefixIcon:
                              Icon(Icons.person, color: Color(0xff28a745)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: SizedBox(
                        height: 45,
                        child: TextField(
                          controller: mobileController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(8, 8)),
                              borderSide: BorderSide(color: Color(0xff28a745)),
                            ),
                            labelText: 'Mobile Number',
                            prefixIcon: Icon(
                              Icons.call,
                              color: Color(0xff28a745),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8)),
                            borderSide: BorderSide(color: Color(0xff28a745)),
                          ),
                          labelText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xff28a745),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: SizedBox(
                        height: 45,
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(8, 8)),
                              borderSide: BorderSide(color: Color(0xff28a745)),
                            ),
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xff28a745),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: confirmPassController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8)),
                            borderSide: BorderSide(color: Color(0xff28a745)),
                          ),
                          labelText: ' Confirm Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xff28a745),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff28a745),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(8, 8))),
                          ),
                          onPressed: () {
                            signUp();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: Text(
                          'Back To Login',
                          style: GoogleFonts.fahkwang(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xff28a745),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() {
    String name = nameController.text;
    String email = emailController.text;
    String mobile = mobileController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPassController.text;

    if (name.isEmpty) {
      message('Enter Name');
      return;
    }
    if (email.isEmpty) {
      message('Enter Email Address');
      return;
    }
    if (mobile.isEmpty) {
      message('Enter Mobile Number');
      return;
    }
    if (password.isEmpty) {
      message('Enter Password');
      return;
    }
    if (confirmPassword.isEmpty) {
      message('Enter Confirm Password');
      return;
    }
    Map<String, String> body = {
      'name': name,
      'mobile': mobile,
      'email': email,
      'password': password,
      're_password': confirmPassword,
    };

    setState(() {
      isSignUp = true;
    });
    ApiHelper().signUp(body).then((value) {
      if (value.message == "Register successfully") {
        message('SignUp Successefull');
        Navigator.pushNamed(context, 'login');
        return;
      } else {
        message('Try Again...');
        return;
      }
    });
  }

  void message(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
