import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ipr/chat_bot.dart';
import 'package:ipr/components/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ipr/pages/search_district.dart';
import 'package:ipr/pages/search_geo.dart';
import 'package:ipr/pages/search_pin.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/account_images_json.dart';
import 'package:ipr/util/vaibhav_details.dart';
import 'dart:ui';

class AgentSearchPage extends StatefulWidget {
  @override
  _AgentSearchPageState createState() => _AgentSearchPageState();
}

class _AgentSearchPageState extends State<AgentSearchPage> {
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
    'assets/images/map.png',
  ];
  List<String> state = [
    'Search by pincode',
    'Search by district',
    'Search by geolocation',
  ];
  List page = [ChatScreen(), ChatScreen(), ChatScreen()];
  List<String> des = [
    'Nearest agent to your pincode will be searched ',
    'Agent details in your district will be shown ',
    'Agent nearest to your current location will be searched ',
  ];
  Position position;
  void giveposition() async {
    position = 
    await _determinePosition();
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
            child: Column(
              children: <Widget>[
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/AgentSearchPic.png'),
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
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 6 / 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _listItem.length,
                      itemBuilder: (BuildContext ctx, index) {
                        final item = _listItem[index];
                        return Container(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Color.fromRGBO(220, 220, 220, 1),
                            elevation: 3,
                            child: InkWell(
                              onTap: () {
                                x = state[index];
                                if (statesel == 1 && x == "Search by pincode") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          SearchPin(selectedValue),
                                    ),
                                  );
                                } else if (statesel == 1 &&
                                    x == "Search by district") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          SearchDistrictPage(selectedValue),
                                    ),
                                  );
                                } else if (statesel == 1 &&
                                    x == "Search by geolocation") {
                                  print(
                                    position.latitude,
                                  );
                                  print(position.longitude);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          SearchGeoPage(
                                              selectedValue,
                                              position.latitude,
                                              position.longitude),
                                    ),
                                  );
                                } else {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text('Select an IP'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
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
                                        _listItem[index],
                                        height: 70,
                                        width: 35,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 70),
                                    child: Text(state[index],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 70),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 31),
                                      child: Text(des[index],
                                          style: TextStyle(
                                            fontSize: 11,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
