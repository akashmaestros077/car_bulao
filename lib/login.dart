import 'package:car_bulao/Api/Api.Helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SessionManager.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center content vertically
                  children: [
                    SizedBox(
                        height: 150,
                        child: Image.asset('assets/logo.png',
                            height: 100, width: 100)),
                    SizedBox(
                      height: 50,
                      child: Text(
                        'LOGIN',
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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8)),
                            borderSide: BorderSide(color: Color(0xff28a745)),
                          ),
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xff28a745),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'forgot_password');
                        },
                        child: Text(
                          'Forgot Password*',
                          style: GoogleFonts.fahkwang(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: isLogin
                          ? CircularProgressIndicator()
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff28a745),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(8, 8))),
                                  ),
                                  onPressed: () {
                                    login();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'LOGIN',
                                      style: GoogleFonts.fahkwang(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'sign_up');
                        },
                        child: Text(
                          'Create Account',
                          style: GoogleFonts.fahkwang(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xff28a745),
                          ),
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

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty) {
      message('Enter Email');
      return;
    }
    if (password.isEmpty) {
      message('Enter Password');
      return;
    }
    Map<String, String> body = {
      'email': email,
      'password': password,
    };
    setState(() {
      isLogin = false;
    });

    ApiHelper().login(body).then((value) async {
      if (value.message == "login successfully") {
        message('SignIn Successfully');
        SessionManager.setUserID(value.userData!.id!);
        SessionManager.setUserEmail(value.userData!.email!);
        SessionManager.setUserLoggedIn(true);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        message('SignIn Failed');
        return;
      }
    });
  }

  void message(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
    ));
  }
}
