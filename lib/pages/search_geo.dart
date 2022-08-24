import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ipr/pages/agentlist.dart';
import 'package:ipr/pages/themeHelper.dart';

class SearchGeoPage extends StatefulWidget {
  SearchGeoPage(this.val, this.latitude, this.longitude);
  String val;
  double latitude;
  double longitude;
  @override
  _SearchGeoPageState createState() => _SearchGeoPageState();
}

class _SearchGeoPageState extends State<SearchGeoPage> {
  List agent = [];

  List _selectedagents = [];
  void checkbypincode() async {
    agent = [];
    String field = widget.val == "Patent"
        ? "patent"
        : widget.val == "Trademark"
            ? "trademark"
            : widget.val == "Copyright"
                ? "copyright"
                : "industrydesign";
    QuerySnapshot qsnap = await FirebaseFirestore.instance
        .collection("agents")
        // .where('country', isEqualTo: country)
        // .where('state', isEqualTo: state)
        // .where('city', isEqualTo: city)
        // .where(field, isEqualTo: true)
        .get();

    for (var element in qsnap.docs) {
      agent.add(element.data());
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void get_selectedagentslist() {
    _selectedagents = [];
    for (var element in agent) {
      print(element);
      print(_value);
      if (calculateDistance(widget.latitude, widget.longitude,
              element["latitude"], element["longitude"]) <
          _value) {
        print(calculateDistance(widget.latitude, widget.longitude,
            element["latitude"], element["longitude"]));
        setState(() {
          _selectedagents.add(element);
        });
      }
    }
    setState(() {
      _selectedagents;
    });
    print(_selectedagents);
    print(_selectedagents.length);
  }

  double _value = 0;
  @override
  void initState() {
    checkbypincode();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Slider(
            divisions: 10,
            min: 0,
            max: 100,
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
              setState(() {
                get_selectedagentslist();
              });
              setState(() {
                _selectedagents;
              });
            },
          ),
          Text("Distance we are searching on: " + _value.toString()),
          Text("No. of agents found: " + _selectedagents.length.toString()),
          Container(
              height: 40,
              width: 200,
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 7, 10, 10),
                    child: Text(
                      "View Agents".toUpperCase(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    //count1++;

                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            AgentList(_selectedagents),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
