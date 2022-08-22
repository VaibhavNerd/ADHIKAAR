import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ipr/components/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ipr/pages/help.dart';
import 'package:ipr/pages/home_page.dart';
import 'package:ipr/pages/lang.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/account_images_json.dart';
import 'package:ipr/util/vaibhav_details.dart';
import 'dart:ui';
import 'package:ipr/pages/themeHelper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RaisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RaisePageState();
  }
}

class _RaisePageState extends State<RaisePage> {
  final _formKey = GlobalKey<FormState>();
  bool checked1Value = false;
  bool checkbox1Value = false;
  bool checked2Value = false;
  bool checkbox2Value = false;
  bool checked3Value = false;
  bool checkbox3Value = false;
  bool checked4Value = false;
  bool checkbox4Value = false;
  int count = 0;
  int count1 = 0;
  int statesel = 0;
  int dissel = 0;

  var selectedstate;
  var selectedType2;
  List<String> _states = <String>[
    "Patent",
    "Trademark",
    "Copyright",
    "Industrial Design",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                width: 300,
                                height: 300,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/raisepic.png'),
                                                fit: BoxFit.cover)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Raise your objection ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Give details below about your product to raise objection  ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          //margin: EdgeInsets.fromLTRB(0, 0, 190, 0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  //margin: EdgeInsets.fromLTRB(10, 0, 40, 0),
                                  child: DropdownButton(
                                    items: _states
                                        .map((value) => DropdownMenuItem(
                                              child: Text(
                                                value,
                                                style: TextStyle(),
                                              ),
                                              value: value,
                                            ))
                                        .toList(),
                                    onChanged: (selectedAccountType) {
                                      //count1++;
                                      statesel = 1;
                                      print('$selectedAccountType');
                                      setState(() {
                                        selectedstate = selectedAccountType;
                                      });
                                    },
                                    value: selectedstate,
                                    isExpanded: false,
                                    hint: Text(
                                      'Type of IPR',
                                      style: TextStyle(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'Application ID', 'Enter your Application ID'),
                            validator: (val) {
                              if ((val.length == 0)) {
                                return "Application ID cannot be empty";
                              } else {
                                //count1++;
                              }
                              count1++;
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'Applicant Name', 'Enter Applicant Name'),
                            validator: (val) {
                              if ((val.length == 0)) {
                                return "Applicant's name cannot be empty";
                              } else {
                                //count1++;
                              }
                              count1++;
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        TextField(
                          decoration: ThemeHelper().textInputDecoration(
                              'Objection', 'Enter your objection'),
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines:
                              100, // when user presses enter it will adapt to it
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Upload related documents * ",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "submit".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
