import 'dart:ui';
import 'package:zoi/screens/patientloginscreen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:zoi/screens/patientAppointment.dart';
import 'package:zoi/screens/profile.dart';
import 'package:auto_size_text/auto_size_text.dart';

DateTime now = DateTime.now();
int min = DateTime.now().minute;
String formattedDate = DateFormat('yyyy-MM-dd').format(now);

class Doctor extends StatefulWidget {
  final AppointUser user;
  final DetailsAppoint details;
  int countReq;
  Doctor(this.user, this.details, this.countReq);
  @override
  _Doctor createState() => _Doctor();
}

class _Doctor extends State<Doctor> {
  final fees = TextEditingController();
  bool go = false;
  bool appo = false;
  int count = 0;
  double fee;
  String s;
  String passFee;
  bool status;
  Widget tapLoad() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            width: 450,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(widget.user.userName),
                      subtitle: Text(widget.user.gender),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.access_time),
                      title: Text(widget.details.date),
                      subtitle: Text(widget.details.time),
                    ),
                  ),
                  appo != true
                      ? Text("Appointment Fee: Not Yet Set")
                      : Text("Appointment Fee: ₱  ${fees.text.toString()}"),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: fees,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "Set Appointment Fee",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: HexColor("#12f48a")),
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      splashColor: Colors.red,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        confirm();
                      },
                      child: AutoSizeText(
                        "Resolve",
                        //  maxLines: 1,
                        style: TextStyle(fontSize: 20.0, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
    return Container();
  }

  Widget tapReq() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            width: 450,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.healing,
                        color: HexColor("#12f48a"),
                      ),
                      title: Text(widget.user.userName),
                      trailing: Text("$min min ago"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.access_time,
                        color: HexColor("#12f48a"),
                      ),
                      title: Text(widget.details.date),
                      subtitle: Text(widget.details.time),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.event_note,
                        color: HexColor("#12f48a"),
                      ),
                      title: Text(widget.user.userReason),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          splashColor: Colors.blue,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {
                            setState(() {
                              count++;
                              widget.countReq--;
                              go = true;
                            });
                          },
                          child: AutoSizeText(
                            "ACCEPT",
                            //  maxLines: 1,
                            style: TextStyle(
                                fontSize: 20.0, color: HexColor("12f48a")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          splashColor: Colors.red,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {},
                          child: AutoSizeText(
                            "REJECT",
                            //  maxLines: 1,
                            style: TextStyle(fontSize: 20.0, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
    return Container();
  }

  Widget req() {
    return Column(
      children: <Widget>[
        widget.countReq > 0
            ? Card(
                child: ListTile(
                  onTap: () {
                    tapReq();
                  },
                  leading: Icon(Icons.queue),
                  title: Text("${widget.user.userName}"),
                  subtitle: Text("${widget.details.date}"),
                  trailing: Text("${widget.details.time}"),
                ),
              )
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 300,
                          height: 300,
                          child: Image.asset("assets/newEmpty.png")),
                      Text("No Requests so Far!"),
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  Widget tapHistory() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            width: 450,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.event_note),
                      title: Text(widget.user.userReason),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
    return Container();
  }

  Widget history() {
    return Column(
      children: <Widget>[
        go != false
            ? Card(
                color: Colors.red,
                child: ListTile(
                  onTap: () {
                    tapHistory();
                  },
                  leading: Icon(Icons.healing),
                  title: Text("${widget.user.userName}"),
                  subtitle: Text("${widget.details.time}"),
                  trailing: Text("${widget.details.date}"),
                ),
              )
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 300,
                          height: 300,
                          child: Image.asset("assets/newEmpty.png")),
                      Text("No Hitory so Far!"),
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  Widget load() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 13.0,
                animation: true,
                percent: 0.4,
                center: Text("40%"),
                progressColor: HexColor("#12f48a"),
                footer: Text(
                  "Capacity",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    "$count",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text("Appointments"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 40.0,
                ),
                onPressed: () {},
              ),
              Text(
                formattedDate,
                style: TextStyle(fontSize: 20.0),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, size: 40.0),
                onPressed: () {},
              ),
            ],
          ),
          count > 0
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                      child: ListTile(
                    onTap: () {
                      tapLoad();
                    },
                    leading: Icon(
                      Icons.perm_phone_msg,
                      color: HexColor("#12f48a"),
                    ),
                    title: Text(widget.user.userName),
                    trailing: Text(widget.details.time),
                  )),
                )
              : Text("No loads as of now.")
        ],
      ),
    );
  }

  void confirm() {
    // for confirming deletion
    List mao;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Set Appointment Fee?"),
            actions: <Widget>[
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  setState(() {
                    appo = true;
                    passFee = fees.text.toString();
                    status = true;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              0,
                              1,
                              widget.details,
                              widget.user,
                              mao,
                              true,
                              status,
                              passFee,
                            )),
                  );
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 15.0),
              labelPadding: EdgeInsets.only(bottom: 0.0),
              indicatorColor: HexColor("#12f48a"),
              tabs: <Widget>[
                Tab(
                  text: "Manage Load",
                ),
                Tab(
                  text: "Requests",
                ),
                Tab(
                  text: "View History",
                ),
              ],
            ),
            title: Container(
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.healing,
                    size: 30.0,
                    color: HexColor("#12f48a"),
                  ),
                  title: Text(
                    widget.details.docName,
                    style: TextStyle(fontSize: 25.0),
                  ),
                  subtitle: Text(widget.details.docSpecial),
                ),
              ),
            ),
            actions: <Widget>[],
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              load(),
              req(),
              history(),
            ],
          ),
        ),
      ),
    );
  }
}
