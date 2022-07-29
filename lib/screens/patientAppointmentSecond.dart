import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:zoi/screens/patientAppointment.dart';
import 'package:zoi/screens/patientAppontmentThird.dart';
import 'package:zoi/screens/patientMainMenu.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:zoi/screens/patientloginscreen.dart';

class AppointSecond extends StatefulWidget {
  final DetailsAppoint details;
  final String name;
  final AppointUser user;
  final List<String> mao;
  AppointSecond(this.name, this.details, this.user, this.mao);
  @override
  _AppointSecond createState() => _AppointSecond();
}

class _AppointSecond extends State<AppointSecond> {
  List userdata = new List();
  int countReq = 0;
  DateTime newDateTime;
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  String getDate = "Pick Date", finalTime = "Pick Hours", _hour, _minute, _time;
  String nameD, specialty, pic;
  TextEditingController _timeController = TextEditingController();

  void populate(String n, String s, String p) {
    setState(() {
      nameD = n;
      specialty = s;
      pic = p;
    });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        finalTime = _timeController.text;
        Navigator.pop(context);
        showOptions();
      });
  }

  void showDate() {
    setState(() async {
      newDateTime = await showRoundedDatePicker(
        context: context,
        theme: ThemeData(primarySwatch: Colors.green),
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1),
        borderRadius: 16,
        listDateDisabled: [
          DateTime.now().subtract(Duration(days: 2)),
          DateTime.now().subtract(Duration(days: 4)),
          DateTime.now().subtract(Duration(days: 6)),
          DateTime.now().subtract(Duration(days: 8)),
          DateTime.now().subtract(Duration(days: 10)),
          DateTime.now().add(Duration(days: 2)),
          DateTime.now().add(Duration(days: 4)),
          DateTime.now().add(Duration(days: 6)),
          DateTime.now().add(Duration(days: 8)),
          DateTime.now().add(Duration(days: 10)),
        ],
      );
      getDate = DateFormat.yMMMMEEEEd().format(newDateTime).toString();

      showOptions();
    });
  }

  void showOptions() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(32.0)),
              width: 450,
              height: 450,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Card(
                        color: HexColor("#12f48a"),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(pic),
                          ),
                          title: Text(nameD,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          subtitle:
                              Text(specialty, style: TextStyle(fontSize: 15.0)),
                        ),
                      ),
                      Card(
                          child: ListTile(
                              leading: Icon(Icons.date_range),
                              title: Text(
                                getDate,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                showDate();
                              })),
                      Card(
                          child: ListTile(
                        leading: Icon(Icons.access_time),
                        title: Text(
                          finalTime,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          _selectTime(context);
                        },
                      )),
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: 200.0,
                        height: 40.0,
                        child: RaisedButton(
                          splashColor: Colors.white,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {
                            confirm();
                          },
                          child: AutoSizeText(
                            "Book Appointment!",
                            //  maxLines: 1,
                            style: TextStyle(
                                fontSize: 20.0, color: HexColor("12f48a")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  List<String> doctors = [
    "Dr. Eren Yeager",
    "Dr. Lowe Abella",
    "Dr. Jasmin Gallaron",
    "Dr. Maria Erika",
    "Dr. Eric Magto",
    "Dr. Adolf Duterte",
  ];
  List<String> special = [
    "Cardiologist",
    "Surgeon",
    "Dermatologist",
    "Dentist Specialist",
    "Family Physician",
    "Anesthesiologist",
  ];
  String dropValue = "Select Department";
  List<String> items = [
    "Select Department",
    "Department of Emergency Medicine.",
    "Department of Ophthalmology",
  ];
  List<String> links = [
    "assets/eren.jpg",
    "assets/lowe.jpg",
    "assets/jasmine.jpg",
    "assets/erika.png",
    "assets/magto.jpg",
    "assets/hitler.jpg",
  ];

  void confirm() {
    // for confirming deletion

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm Booking?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Confirm"),
                onPressed: () {
                  countReq++;
                  setState(() {
                    setData(
                      widget.name,
                      nameD,
                      specialty,
                      getDate,
                      finalTime,
                      "Pending",
                    );
                    popReq(widget.details);

                    Navigator.pop(context);
                    setData(widget.name, nameD, specialty, getDate, finalTime,
                        "Pending");
                  });
                },
              ),
            ],
          );
        });
  }

  void setData(String name, String doc, String special, String date,
      String time, String status) {
    setState(() {
      userdata.add(new DetailsAppoint(doc, special, date, time, name, status));
      userdata.forEach((element) {
        print("DOC NAME: ${element.docName}");
      });

      final det = DetailsAppoint(doc, special, date, time, name, status);
      final user = AppointUser(widget.user.userName, widget.user.userPhone,
          widget.user.userEmail, widget.user.userReason, widget.user.gender);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Booked(countReq, det, user, widget.mao)),
      );
    });
  }

  void popReq(DetailsAppoint det) {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: HexColor("#12f48a"),
          title: Text("Step 2"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: HexColor("#12f48a"),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: dropValue,
                          items: items
                              .map((String val) => DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(
                                      val,
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (String val) {
                            setState(() {
                              dropValue = val;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Available Doctors: ",
                      style: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic)),
                ),
                Expanded(
                  child: ListView(
                    children: new List<Widget>.generate(6, (index) {
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(links[index]),
                          ),
                          title: Text(doctors[index],
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: HexColor("#12f48a"),
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(special[index],
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                          onTap: () {
                            populate(
                                doctors[index], special[index], links[index]);
                            showDate();
                          },
                        ),
                      );
                    }),
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

class Booked extends StatelessWidget {
  final int countReq;
  final DetailsAppoint det;
  final AppointUser user;
  final List<String> mao;
  Booked(this.countReq, this.det, this.user, this.mao);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#12f48a"),
          title: Text("Booking Done!"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Your request has been successfully sent!",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Check your notifications, SMS, or via Email for updats on your request in a few hours",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 14.0),
              ),
              Image.asset("assets/patientlogin.png"),
              RaisedButton(
                splashColor: Colors.white,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  print(countReq);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientSecond(
                              0,
                              countReq,
                              det,
                              user,
                              mao,
                            )),
                  );
                },
                child: AutoSizeText(
                  "DONE",
                  //  maxLines: 1,
                  style: TextStyle(fontSize: 20.0, color: HexColor("12f48a")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
