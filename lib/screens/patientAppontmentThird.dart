import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class AppointThird extends StatefulWidget {
  @override
  _AppointThird createState() => _AppointThird();
}

class _AppointThird extends State<AppointThird> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#12f48a"),
          title: Text("Step 3"),
          centerTitle: true,
        ),
        body: Center(
        
        ),
         
       
      ),
    );
  }
}
