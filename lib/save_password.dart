import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavePassword extends StatefulWidget {
  const SavePassword({Key? key}) : super(key: key);

  @override
  State<SavePassword> createState() => _SavePasswordState();
}

class _SavePasswordState extends State<SavePassword> {
  @override
  Widget build(BuildContext context) {
    return Center( // Center widget added
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                    children: [
                      SizedBox(
                          height: 150,
                          child: Image.asset('assets/logo.png', height: 100, width: 100)),
                      SizedBox(
                        height: 50,
                        child: Text(
                          'Save New Password',
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

                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                              borderSide: BorderSide(color: Color(0xff28a745)),
                            ),
                            labelText: 'New Password',
                            prefixIcon: Icon(
                              Icons.lock,
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                                borderSide: BorderSide(color: Color(0xff28a745)),
                              ),
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xff28a745),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 20),
                        child: SizedBox(
                          height: 45,width: double.infinity,
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff28a745),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'SAVE',
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


                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'sign_up');
                          },
                          child: Text('Back To Login',
                            style: GoogleFonts.fahkwang(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color:Color(0xff28a745),
                            ),),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
