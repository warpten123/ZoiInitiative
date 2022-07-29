import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zoi/screens/patientAppointment.dart';
import 'package:zoi/screens/patientAppointmentSecond.dart';
import 'package:zoi/screens/patientloginscreen.dart';
import 'package:zoi/screens/payApp.dart';
import 'package:zoi/screens/doctor.dart';

class Profile extends StatefulWidget {
  int countNotif;
  int countReq;
  final bool statusGo;
  final String fee;
  final DetailsAppoint details;
  final AppointUser user;
  final List<String>mao;
  final bool go;
  Profile(this.countNotif, this.countReq, this.details, this.user, this.mao,
      this.go, this.statusGo, this.fee);
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  void confirm() {
    // for confirming deletion

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm Delete?"),
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
                  widget.countReq = 0;
                },
              ),
            ],
          );
        });
  }

  Widget notif(int count, String doc, String date, String time) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          count > 0
              ? Expanded(
                  child: ListView.builder(
                    itemCount: count,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.notifications_active,
                            color: Colors.red,
                          ),
                          title: Text("Your requested appointment with $doc"),
                          subtitle: Text("$time @$date"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete_forever),
                            onPressed: () {
                              setState(() {
                                widget.countNotif = 0;
                              });
                            },
                          ),
                        ),
                      );
                    },
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
                        Text("You have no notifications yet!"),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget tapHistory(String doc, String date, String time, String hospy,
      String special, String desc) {
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
                      title: Text("$hospy"),
                      subtitle: Text("$time @$date"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("$doc"),
                      subtitle: Text("$special"),
                    ),
                  ),
                  Container(
                    height: 200.0,
                    child: Card(
                      child: ListTile(
                        title: Text(desc),
                        subtitle: Text("Paid thru GCash"),
                        trailing: Text("${widget.fee}"),
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

  Widget history(int count, String doc, String date, String time, String hospy,
      String special, String desc) {
    return Expanded(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.go == true
                ? Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: HexColor("#12f48a"),
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                tapHistory(doc, date, time, hospy, special, desc);
                              });
                            },
                            leading: Icon(
                              Icons.history,
                              color: Colors.red,
                            ),
                            title: Text("$hospy     $doc"),
                            subtitle: Text("$time @$date     $special"),
                          ),
                        );
                      },
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
                          Text("You have no history yet!"),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget request(
      int count,
      String doc,
      String date,
      String time,
      String name,
      String username,
      String userphone,
      String useremail,
      String reason,
      String status) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.countReq > 0
              ? Expanded(
                  child: ListView.builder(
                    itemCount: count,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            tapRequest(
                                username, userphone, useremail, reason, status);
                          },
                          leading: Icon(
                            Icons.notifications_active,
                            color: Colors.red,
                          ),
                          title: AutoSizeText(
                            "$name",
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: AutoSizeText(
                            "$time @$date",
                            maxLines: 1,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete_forever),
                            onPressed: () {
                              setState(() {
                                confirm();
                              });
                            },
                          ),
                        ),
                      );
                    },
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
                        Text("You have no notifications yet!"),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  void tapRequest(
      String name, String phone, String email, String reason, String status) {
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
                    color: HexColor("#12f48a"),
                    child: ListTile(
                      leading: Icon(Icons.touch_app),
                      title: Text(name),
                      subtitle: Text(email),
                      trailing: Text(phone),
                    ),
                  ),
                  Container(
                    height: 200.0,
                    child: Card(
                      child: ListTile(
                          title: Text(reason),
                          subtitle: widget.statusGo == false
                              ? Text("Pending")
                              : Text("Approved")),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                        splashColor: Colors.white,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          if (widget.statusGo) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pay(
                                      widget.countNotif,
                                      widget.countReq,
                                      widget.details,
                                      widget.user,
                                      widget.mao,
                                      false,
                                      widget.fee,)),
                            );
                          } else
                            Navigator.pop(context);

                          //Navigator.pop(context);
                        },
                        child: widget.statusGo == true
                            ? AutoSizeText(
                                "PAY FEE",

                                //  maxLines: 1,
                                style: TextStyle(
                                    fontSize: 20.0, color: HexColor("12f48a")),
                              )
                            : AutoSizeText(
                                "CONFIRM",
                                //  maxLines: 1,
                                style: TextStyle(
                                    fontSize: 20.0, color: HexColor("12f48a")),
                              )),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 15.0),
              labelPadding: EdgeInsets.only(bottom: 0.0),
              indicatorColor: HexColor("#12f48a"),
              tabs: <Widget>[
                Tab(
                  text: "Notifications",
                ),
                Tab(
                  text: "Requests",
                ),
                Tab(
                  text: "View History",
                ),
              ],
            ),
            title: Text(
              "${widget.user.userName}",
              style: TextStyle(color: HexColor("#12f48a")),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: HexColor("#12f48a"),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Doctor(
                            widget.user, widget.details, widget.countReq)),
                  );
                },
              ),
            ],
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              notif(widget.countNotif, widget.details.docName,
                  widget.details.date, widget.details.time),
              request(
                widget.countReq,
                widget.details.docName,
                widget.details.date,
                widget.details.time,
                widget.details.hospyName,
                widget.user.userName,
                widget.user.userPhone,
                widget.user.userEmail,
                widget.user.userReason,
                widget.details.status,
              ),
              history(
                  widget.countReq,
                  widget.details.docName,
                  widget.details.date,
                  widget.details.time,
                  widget.details.hospyName,
                  widget.details.docSpecial,
                  widget.user.userReason)
            ],
          ),
        ),
      ),
    );
  }
}
/*
  Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 50.0,
                    ),
                    title: Text("shit"),
                    subtitle: Text("Edit Information."),
                  ),
                
               
                
              ],
            ),
*/
