import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'screens/patientloginscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
void main() {
  runApp(Third());
}
class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('th', 'TH'), // Thai
    ],
      home: HomeScreen(),
    theme: ThemeData(
primaryColor: Colors.lightGreenAccent,
    ),
    
    
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: HexColor('#12f48a'),
          title: Text("Zoi Initiative"),
          centerTitle: true,
        ),
        body: PatientLogInScreen(),
      ),
    );
  }
}
