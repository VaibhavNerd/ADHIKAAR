import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ipr/chat_bot.dart';
import 'package:ipr/components/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ipr/market/buyNational.dart';
import 'package:ipr/pages/search_district.dart';
import 'package:ipr/pages/search_geo.dart';
import 'package:ipr/pages/search_international.dart';
import 'package:ipr/pages/search_pin.dart';
import 'package:ipr/pages/submittedapplication.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/account_images_json.dart';
import 'package:ipr/util/vaibhav_details.dart';
import 'dart:ui';

class IPRmarket extends StatefulWidget {
  @override
  _IPRmarketState createState() => _IPRmarketState();
}

class _IPRmarketState extends State<IPRmarket> {
  int statesel = 0;
  String selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();
  String x = "";

  var selectedstate;
  List<String> _states = <String>[
    "Patent",
    "Trademark",
    "Copyright",
    "Industry Design",
  ];

  final List<String> _listItem = [
    'assets/images/pin.png',
    'assets/images/city.png',
    'assets/images/city.png',
  ];
  List<String> state = [
    'BUY NATIONAL',
    'BUY INTERNATIONAL',
    'SELL',
  ];

  List<String> des = [
    ' ',
    ' ',
    'your IPRs',
  ];
  Position position;
  void giveposition() async {
    position = await _determinePosition();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    giveposition();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Center(
          child: Text(
            "Searching an agent ?",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Center(child: Icon(Icons.menu)),
            ),
          )
        ],
      ),
      body: Form(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(19.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/AgentSearchPic.png'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration:
                        InputDecoration(contentPadding: EdgeInsets.all(10)),
                    hint: Text(
                      'Select IP type',
                      style: TextStyle(),
                    ),
                    dropdownColor: Colors.white,
                    value: selectedValue,
                    onChanged: (String newValue) {
                      setState(() {
                        selectedValue = newValue;
                        statesel = 1;
                      });
                    },
                    items: _states
                        .map((value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(),
                              ),
                              value: value,
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      elevation: 3,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  BuyNational(selectedValue),
                              // >>>>>>> master
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Image.asset(
                                  _listItem[0],
                                  height: 70,
                                  width: 35,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 60),
                              child: Text(state[0],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 70),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 31),
                                child: Text(des[0],
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      elevation: 3,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  SearchInternationalIPR(selectedValue),
                              // >>>>>>> master
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Image.asset(
                                  _listItem[1],
                                  height: 70,
                                  width: 35,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 60),
                              child: Text(state[1],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 70),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 31),
                                child: Text(des[1],
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      elevation: 3,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  SubmittedApplication(),
                              // >>>>>>> master
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Image.asset(
                                  _listItem[2],
                                  height: 70,
                                  width: 35,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 60),
                              child: Text(state[2],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 70),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 31),
                                child: Text(des[2],
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
