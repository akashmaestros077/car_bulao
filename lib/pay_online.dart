

import 'package:flutter/material.dart';

class PayOnline extends StatefulWidget {
  const PayOnline({Key? key}) : super(key: key);

  @override
  State<PayOnline> createState() => _PayOnlineState();
}

class _PayOnlineState extends State<PayOnline> {
  @override
  Widget build(BuildContext context) {
    bool value = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
        actions: [
          SizedBox(
              width: 50,
             child: Icon(Icons.g_translate,color: Colors.white,size: 20,),),
          SizedBox(width: 50,
              child: Icon(Icons.cancel,color: Colors.white,size: 20),),

        ],
      ),

    );
  }
}
