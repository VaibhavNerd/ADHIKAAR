import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ipr/model/ipr_model.dart';
import 'package:ipr/patent_forms/form1.dart';
import 'package:ipr/patent_forms/form2.dart';
import 'package:ipr/services/firebase_services.dart';

class OngoingForms extends StatefulWidget {
  OngoingForms(this.applicationid);
  String applicationid;
  @override
  State<OngoingForms> createState() => _OngoingFormsState();
}

class _OngoingFormsState extends State<OngoingForms> {
  Map<String, dynamic> ipr = {};

  getipr() async {
    ipr = await getformdatafromid(widget.applicationid);
    setState(() {
      ipr;
    });
  }

  @override
  void initState() {
    getipr();
    print(((ipr["formsdone"] ?? []) as List).contains(1));
    // TODO: implement initState
    super.initState();
  }

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("Application Id:\n ${widget.applicationid}"),
                        ),
                        Column(
                          children: [
                            Text("${isSwitched ? "Complete" : "Provisional"}"),
                            Switch(
                              onChanged: toggleSwitch,
                              value: isSwitched,
                              activeColor: Colors.blue,
                              activeTrackColor: Colors.blue,
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.grey,
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Application Started:\n ${ipr["timeapplied"].toString().substring(0, 16)}"),
                          Text(
                              "Application Updated:\n ${ipr["timewhenlastchanged"].toString().substring(0, 16)}"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Application Status:\n ${ipr["status"].toString()}"),
                          Text(
                              "Application Status:\n ${ipr["update"].toString()}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      PatentForm1(widget.applicationid),
                ),
              );
            },
            child: Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    title: Text(
                      "Form 1",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: !((ipr["formsdone"] ?? []) as List).contains(1)
                        ? Text(" Please fill this form to unlock others",
                            style: TextStyle(color: Colors.white))
                        : null,
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Colors.white, size: 30.0)),
              ),
            ),
          ),
          ((ipr["formsdone"] ?? []) as List).contains(1)
              ? Column(
                  children: [
                    isSwitched
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      PatentForm2(widget.applicationid),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 8.0,
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(64, 75, 96, .9)),
                                child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    title: Text(
                                      "Form 2",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                    // subtitle: Text(" Please fill this form to unlock others",
                                    //     style: TextStyle(color: Colors.white)),
                                    trailing: Icon(Icons.keyboard_arrow_right,
                                        color: Colors.white, size: 30.0)),
                              ),
                            ),
                          )
                        : Container(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                PatentForm2(widget.applicationid),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(64, 75, 96, .9)),
                          child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              title: Text(
                                "Form 3",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                              // subtitle: Text(" Please fill this form to unlock others",
                              //     style: TextStyle(color: Colors.white)),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white, size: 30.0)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                PatentForm2(widget.applicationid),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(64, 75, 96, .9)),
                          child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              title: Text(
                                "Form 5",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                              // subtitle: Text(" Please fill this form to unlock others",
                              //     style: TextStyle(color: Colors.white)),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white, size: 30.0)),
                        ),
                      ),
                    ),
                    isSwitched
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      PatentForm2(widget.applicationid),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 8.0,
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(64, 75, 96, .9)),
                                child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    title: Text(
                                      "Form 18",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                    // subtitle: Text(" Please fill this form to unlock others",
                                    //     style: TextStyle(color: Colors.white)),
                                    trailing: Icon(Icons.keyboard_arrow_right,
                                        color: Colors.white, size: 30.0)),
                              ),
                            ),
                          )
                        : Container(),
                    isSwitched
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      PatentForm2(widget.applicationid),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 8.0,
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(64, 75, 96, .9)),
                                child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    title: Text(
                                      "Form 25",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                    // subtitle: Text(" Please fill this form to unlock others",
                                    //     style: TextStyle(color: Colors.white)),
                                    trailing: Icon(Icons.keyboard_arrow_right,
                                        color: Colors.white, size: 30.0)),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  final makeCard = Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            "Form 1",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale, color: Colors.yellowAccent),
              Text(" Please fill this form to unlock others",
                  style: TextStyle(color: Colors.white))
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 30.0)),
    ),
  );
}
