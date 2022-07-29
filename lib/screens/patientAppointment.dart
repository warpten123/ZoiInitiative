import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:zoi/screens/patientAppointmentSecond.dart';
import 'package:zoi/screens/patientMainMenu.dart';
import 'package:zoi/screens/patientloginscreen.dart';

class AppointUser {
  final String userName;
  final String userPhone;
  final String userEmail;
  final String userReason;
  final String gender;
  AppointUser(this.userName, this.userPhone, this.userEmail, this.userReason,
      this.gender);
}

class Appoint extends StatefulWidget {
  final String name;
  final String link;
  final DetailsAppoint details;
  final List<String> mao;
  Appoint(this.name, this.link, this.details, this.mao);
  @override
  _Appoint createState() => _Appoint();
}

class _Appoint extends State<Appoint> {
  final nameControl = TextEditingController();
  final phoneControl = TextEditingController();
  final emailControl = TextEditingController();
  final reasonControl = TextEditingController();
  String isSelected;
  void initState() {
    super.initState();
    isSelected = " ";
  }

  void selected(String val) {
    setState(() {
      isSelected = val;
    });
  }

  Widget reason() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(32.0)),
            width: 450,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: reasonControl,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.event_note,
                    color: HexColor("#12f48a"),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  labelText: "Reasons/Symptoms",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: HexColor("#12f48a")),
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
          );
        });
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //  backgroundColor: HexColor("#12f48a"),
        appBar: AppBar(
          backgroundColor: HexColor("#12f48a"),
          title: Text("Book an Appointment"),
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(widget.link),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        widget.name,
                        style: TextStyle(fontSize: 40.0),
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: nameControl,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.supervised_user_circle,
                              color: HexColor("#12f48a")),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "Full Name",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: HexColor("#12f48a")),
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: phoneControl,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: HexColor("#12f48a"),
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "Phone Number",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: HexColor("#12f48a")),
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: emailControl,
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.email, color: HexColor("#12f48a")),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "Email Address",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: HexColor("#12f48a")),
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Gender"),
                          Container(
                            width: 130,
                            height: 50,
                            child: ListTile(
                              title: AutoSizeText(
                                "Male",
                                maxLines: 1,
                                // style: TextStyle(fontSize: 20),
                              ),
                              leading: Radio(
                                onChanged: (val) {
                                  selected(val);
                                },
                                value: "male",
                                groupValue: isSelected,
                                activeColor: HexColor("#12f48a"),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            child: ListTile(
                              title: Text(
                                "Female",
                                maxLines: 1,
                                // style: TextStyle(fontSize: 20),
                              ),
                              leading: Radio(
                                onChanged: (val) {
                                  selected(val);
                                },
                                groupValue: isSelected,
                                value: "female",
                                activeColor: HexColor("#12f48a"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 150.0,
                height: 50.0,
                child: RaisedButton.icon(
                  splashColor: HexColor("#12f48a"),
                  color: Colors.white,
                  onPressed: () {
                    reason();
                  },
                  label: Text("Reason", style: TextStyle(fontSize: 20.0)),
                  icon: Icon(
                    Icons.question_answer,
                    size: 35.0,
                    color: HexColor("#12f48a"),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: HexColor("#12f48a"))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: HexColor("#12f48a"),
                  child: Icon(
                    Icons.navigate_next,
                    size: 40.0,
                  ),
                  onPressed: () {
                    final data = AppointUser(
                      nameControl.text,
                      phoneControl.text,
                      emailControl.text,
                      reasonControl.text,
                      isSelected,
                    );
                    print("asd");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointSecond(
                              widget.name, widget.details, data, widget.mao)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
