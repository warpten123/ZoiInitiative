import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:zoi/screens/patientloginscreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';
import 'package:zoi/screens/patientAppointment.dart';
import 'package:zoi/screens/profile.dart';

class PatientSecond extends StatefulWidget {
  final int countReq, countNotif;
  final DetailsAppoint details;
  final AppointUser user;
  final List<String> mao;
  PatientSecond(
      this.countNotif, this.countReq, this.details, this.user, this.mao);

  @override
  _PatientSecond createState() => _PatientSecond();
}

class _PatientSecond extends State<PatientSecond> {
  double perc;
  int count = 0;
  void getPercent(double percent) {
    perc = percent * 100;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: HexColor("#12f48a"),
          title: Text("Search Hospital"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: Search(widget.mao, widget.details, widget.mao));
                }),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                print("REQEST: ${widget.countReq}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(
                          widget.countNotif,
                          widget.countReq,
                          widget.details,
                          widget.user,
                          widget.mao,
                          false,
                          false,
                          "0")),
                );
              },
            ),
          ],
        ),
        body: Back(),
      ),
    );
  }
}

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 900,
          height: 650,
          // constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backH.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class Search extends SearchDelegate {
  DetailsAppoint details;
  Random random = new Random();
  int rating, tempCap;
  double hospyCapacity, dbTxt;
  String hospyName, hospyLogo, hospyAddress, hospyDesc;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selected;
  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: <Widget>[
        selected.isEmpty ? Text("No Search Found!") : Text(selected)
      ],
    );
  }

  List<String> recent = [];
  final List<String> listEx;
  final List mao;
  Search(this.listEx, this.details, this.mao);
  @override
  Widget buildSuggestions(BuildContext context) {
    Widget book(double rating, double cap, String add, String name, String logo,
        double txt) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircularPercentIndicator(
                          radius: 120.0,
                          lineWidth: 13.0,
                          animation: true,
                          percent: cap,
                          center: Text("${txt.toInt()}%"),
                          progressColor: HexColor("#12f48a"),
                          footer: Text(
                            "Capacity",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 90.0,
                            ),
                            Text(
                              "73 miles away from you.",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Card(
                      child: ListTile(
                        leading:
                            CircleAvatar(backgroundImage: AssetImage(logo)),
                        title: Text(
                          name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: RatingBar.builder(
                          itemSize: 15.0,
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, _) =>
                              Icon(Icons.star, color: Colors.amber),
                        ),
                        subtitle: Text(
                          add,
                          style: TextStyle(color: HexColor("#12f48a")),
                        ),
                      ),
                    ),
                    Text(
                      hospyDesc,
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            height: 50.0,
                            child: RaisedButton.icon(
                              splashColor: HexColor("#12f48a"),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Appoint(
                                            name,
                                            logo,
                                            details,
                                            mao,
                                          )),
                                );
                              },
                              label: Text("Appointment"),
                              icon: Icon(
                                Icons.bookmark,
                                color: HexColor("#12f48a"),
                                size: 35.0,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: HexColor("#12f48a"))),
                            ),
                          ),
                          Container(
                            width: 150.0,
                            height: 50.0,
                            child: RaisedButton.icon(
                              splashColor: HexColor("#12f48a"),
                              color: Colors.white,
                              onPressed: () {},
                              label: Text("Contact"),
                              icon: Icon(
                                Icons.phone,
                                size: 35.0,
                                color: HexColor("#12f48a"),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: HexColor("#12f48a"))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
      return Container();
    }

    List<String> suggestions = [];
    query.isEmpty
        ? suggestions = recent
        : suggestions.addAll(listEx.where(
            (element) => element.contains(query),
          ));
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            print(suggestions[index]);
            rating = random.nextInt(5) + 1;
            tempCap = random.nextInt(100) + 1;
            hospyCapacity = tempCap / 100;
            dbTxt = hospyCapacity * 100;
            selected = suggestions[index];
            showResults(context);
            Navigator.pop(context);
            if (suggestions[index] == "Chong Hua Hospital") {
              hospyName = "Chong Hua Hospital";
              hospyAddress = "Don Mariano Cui St., Fuente Osmeña, Cebu City";
              hospyLogo = "assets/hospy1.png";
              hospyDesc =
                  "At Chong Hua Hospital, everyone in the medical community and management staff is a partner in your care. Our concept of "
                  'Patient-Focused Care'
                  " puts you, the patient, first! The concept of "
                  'Patient-Focused Care'
                  " is not unique, but Chong Hua Hospital, its provider and staff have taken this to a new level.";
            } else if (suggestions[index] == "UC Med") {
              hospyName = "UC Med";
              hospyAddress = "A1 Ouano Avenue, Mandaue City, 6014 Cebu";
              hospyLogo = "assets/hospy2.png";
              hospyDesc =
                  "The Company has been established as a premiere institution committed to provide quality, affordable, efficient and person-centered healthcare through its state-of-the-art medical facilities and excellent medical staff. UCMed is envisioned to be a tertiary hospital with a 300-bed capacity. ";
            }
            book(rating.toDouble(), hospyCapacity, hospyAddress, hospyName,
                hospyLogo, dbTxt);
          },
        );
      },
    );
  }
}
