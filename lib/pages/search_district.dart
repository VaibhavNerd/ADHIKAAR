import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ipr/chat_bot.dart';
import 'package:ipr/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ipr/pages/agentlist.dart';
import 'package:ipr/pages/search_district.dart';
import 'package:ipr/pages/search_geo.dart';
import 'package:ipr/pages/search_pin.dart';
import 'package:ipr/pages/help.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/account_images_json.dart';
import 'package:ipr/util/vaibhav_details.dart';
import 'dart:ui';
import 'package:ipr/pages/themeHelper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchDistrictPage extends StatefulWidget {
  SearchDistrictPage(this.val);
  String val;
  @override
  _SearchDistrictPageState createState() => _SearchDistrictPageState();
}

class _SearchDistrictPageState extends State<SearchDistrictPage> {
  List agent = [];
  Future<void> checkbypincode(String country, String state, String city) async {
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
        .where('country', isEqualTo: country)
        .where('state', isEqualTo: state)
        .where('city', isEqualTo: city)
        .where(field, isEqualTo: true)
        .get();

    for (var element in qsnap.docs) {
      agent.add(element.data());
    }
  }

  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int count = 0;
  int count1 = 0;
  int statesel = 0;
  int dissel = 0;

  var selectedstate;
  var selectedType2;
  List<String> _states = <String>[
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Lakshadweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back),
        title: Center(
          child: Text(
            "Search by district",
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
        key: _formKey,
        child: SafeArea(
          child: Container(
            //padding: EdgeInsets.all(19.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/cityman.png'),
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
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Text(
                    "To search an agent in your district select your district from below",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                // Center(
                //   child: Text(
                //     "Our crew of superheros are standing by \n             for your support and service !",
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 13,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                CountryStateCityPicker(
                  country: country,
                  state: state,
                  city: city,
                  textFieldInputBorder: UnderlineInputBorder(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  width: 130,
                  decoration: ThemeHelper().buttonBoxDecoration(context),
                  child: ElevatedButton(
                    style: ThemeHelper().buttonStyle(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 7, 10, 10),
                      child: Text(
                        "Search".toUpperCase(),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      //count1++;
                      if (_formKey.currentState.validate()) {
                        if (_formKey.currentState.validate()) {
                          checkbypincode(country.text, state.text, city.text)
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    AgentList(agent),
                              ),
                            );
                          });
                        }
                      }
                    },
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
