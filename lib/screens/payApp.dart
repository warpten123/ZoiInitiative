import 'dart:ui';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zoi/screens/patientAppointment.dart';
import 'package:zoi/screens/patientMainMenu.dart';
import 'package:zoi/screens/patientloginscreen.dart';
import 'package:zoi/screens/profile.dart';

class Pay extends StatefulWidget {
  int countNotif;
  int countReq;
  final String fee;
  final DetailsAppoint details;
  final AppointUser user;
  List mao;
  final bool go;
  Pay(this.countNotif, this.countReq, this.details, this.user, this.mao,
      this.go, this.fee);

  @override
  _Pay createState() => _Pay();
}

class Hospitals {
  String name;
  double fee;
  int capacity;
  double rating;
  Hospitals(this.name, this.fee, this.capacity, this.rating);
}

class _Pay extends State<Pay> {
  void select() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: HexColor("#12f48a"),
            ),
            width: 450,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SELECT PAYMENT METHOD:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  Card(
                      child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaySecond(
                                widget.countNotif,
                                widget.countReq,
                                widget.details,
                                widget.user,
                                widget.mao,
                                widget.fee)),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/7.png"),
                    ),
                    title: Text(
                      "7 - Eleven",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                  Card(
                      child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaySecond(
                                  widget.countNotif,
                                  widget.countReq,
                                  widget.details,
                                  widget.user,
                                  widget.mao,
                                  widget.fee,
                                )),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/gcash.png"),
                    ),
                    title: Text(
                      "GCash",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                  Card(
                      child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaySecond(
                                  widget.countNotif,
                                  widget.countReq,
                                  widget.details,
                                  widget.user,
                                  widget.mao,
                                  widget.fee,
                                )),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/clicq.png"),
                    ),
                    title: Text(
                      "ClicQ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Manage payments securely with our partnered online payment platforms!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Choose your way of transaction",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(fontSize: 14.0),
            ),
            Image.asset("assets/pay.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 75, height: 75, child: Image.asset("assets/7.png")),
                Container(
                    width: 75,
                    height: 75,
                    child: Image.asset("assets/clicq.png")),
                Container(
                    width: 75,
                    height: 75,
                    child: Image.asset("assets/visa.png")),
                Container(
                    width: 75,
                    height: 75,
                    child: Image.asset("assets/gcash.png")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                splashColor: Colors.white,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  select();
                },
                child: AutoSizeText(
                  "Continue",
                  //  maxLines: 1,
                  style: TextStyle(fontSize: 20.0, color: HexColor("12f48a")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaySecond extends StatefulWidget {
  int countNotif;
  int countReq;
  final String fee;
  final DetailsAppoint details;
  final AppointUser user;
  List mao;
  PaySecond(this.countNotif, this.countReq, this.details, this.user, this.mao,
      this.fee);
  @override
  _PaySecond createState() => _PaySecond();
}

class _PaySecond extends State<PaySecond> {
  List temp, temp2, temp3;
  List<Hospitals> hospiList = [
    Hospitals("Hospi 1", 2000.0, 65, 4),
    Hospitals("Hospi 2", 1950.0, 85, 4),
    Hospitals("Hospi 3", 1750.0, 55, 3),
    Hospitals("Hospi 4", 2500.0, 30, 3),
    Hospitals("Hospi 5", 1250.0, 80, 4),
    Hospitals("Hospi 6", 1000.0, 65, 5),
    Hospitals("Hospi 7", 759.0, 25, 2),
    Hospitals("Hospi 8", 769.0, 45, 2),
    Hospitals("Hospi 9", 860.0, 26, 1),
    Hospitals("Hospi 10", 2500.0, 12, 3),
    Hospitals("Hospi 11", 3400.0, 10, 5),
    Hospitals("Hospi 12", 4500.0, 2, 4),
    Hospitals("Hospi 13", 1250.0, 8, 1),
    Hospitals("Hospi 14", 1750.0, 16, 2),
    Hospitals("Hospi 15", 1600.0, 78, 3),
  ];

  void add() {
    recom.add("Chong Hua Hospital");
    recom.add("UC Med");
  }

  ///////
  void ruleBasedExpert() {
    print(double.parse(widget.fee));
    rule1();
    rule2();
    rule3();
    inferenceEngine();
  }

  void rule1() {
    var toRemove = [];

    for (Hospitals h in hospiList) {
      if (h.fee > double.parse(widget.fee)) {
        toRemove.add(h);
      }
    }
    hospiList.removeWhere((h) => toRemove.contains(h));
    for (Hospitals h in hospiList) {
      print("RULE 1 ${h.name}");
    }
  }

  void rule2() {
    // if capacity is greater 75
    var toRemove = [];

    for (Hospitals h in hospiList) {
      if (h.capacity >= 75) {
        toRemove.add(h);
      }
    }
    hospiList.removeWhere((h) => toRemove.contains(h));
    for (Hospitals h in hospiList) {
      print("RULE 2 ${h.name}");
    }
  }

  void rule3() {
    // if rating is lesser than the previos values
    var toRemove = [];

    for (Hospitals h in hospiList) {
      if (h.rating <= ratingStar) {
        toRemove.add(h);
      }
    }
    hospiList.removeWhere((h) => toRemove.contains(h));
  }

  List<String> recom = [];
  void inferenceEngine() {
    hospiList.forEach((element) {
      recom.add(element.name);
    });
  }

///////////
  double ratingStar;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Your transaction has been successfully recorded!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset("assets/done.png"),
              Text(
                "How was your experience?",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 14.0),
              ),
              RatingBar.builder(
                itemSize: 60.0,
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                onRatingUpdate: (rating) {
                  setState(() {
                    ratingStar = rating;
                  });
                },
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  splashColor: Colors.white,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                    add();
                    ruleBasedExpert();
                    widget.countReq = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientSecond(
                                widget.countNotif,
                                widget.countReq,
                                widget.details,
                                widget.user,
                                recom,
                              )),
                    );
                  },
                  child: AutoSizeText(
                    "Done",
                    //  maxLines: 1,
                    style: TextStyle(fontSize: 20.0, color: HexColor("12f48a")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
