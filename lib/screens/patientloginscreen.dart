import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:zoi/screens/details.dart';
import 'package:zoi/screens/patientMainMenu.dart';
import 'package:zoi/screens/patientAppointment.dart';

class PatientLogInScreen extends StatefulWidget {
  @override
  _PatientLogInScreen createState() => _PatientLogInScreen();
}

class DetailsAppoint {
  final String docName;
  final String docSpecial;
  final String date;
  final String time;
  final String hospyName;
  final String status;

  DetailsAppoint(this.docName, this.docSpecial, this.date, this.time,
      this.hospyName, this.status);
}

class _PatientLogInScreen extends State<PatientLogInScreen> {
  final fees = TextEditingController();
  final List<String> list = ["UC Med", "Chong Hua Hospital"];
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                child: Image.asset("assets/patientlogin.png"),
              ),
              Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: TextField(
                      controller: fees,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.supervised_user_circle),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelText: "Username",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: HexColor("#12f48a")),
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: "Password",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("#12f48a")),
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              Container(
                width: 150.0,
                child: RaisedButton(
                  splashColor: Colors.white,
                  color: HexColor("12f48a"),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                    final data = DetailsAppoint(
                        "none", "none", "none", "none", "none", "none");
                    final data2 = AppointUser(
                        fees.text.toString(), "none", "none", "none", "none");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PatientSecond(0, 0, data, data2, list)),
                    );
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
              Container(
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 95.0),
                  value: val,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: HexColor("#12f48a"),
                  onChanged: (bool value) {
                    setState(() {
                      val = value;
                    });
                  },
                  title: Text(
                    "Remember Me",
                    style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("OR CONNECT WITH",
                    style: TextStyle(color: Colors.grey)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    splashColor: HexColor("#12f48a"),
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/twiLogo.png"),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: HexColor("#12f48a"),
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/fbLogo.png"),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: HexColor("#12f48a"),
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/googleLogo.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
