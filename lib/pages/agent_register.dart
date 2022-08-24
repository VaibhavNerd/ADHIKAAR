import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoder/geocoder.dart';
import 'package:ipr/components/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ipr/pages/choose_map.dart';
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

class RegistrationPage extends StatefulWidget {
  RegistrationPage(this.address, this.latitude, this.longitude);
  Address address;
  double latitude;
  double longitude;
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController agent_number = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  // int statesel = 0;
  // int dissel = 0;
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  String countryValue;
  String stateValue;
  String cityValue;
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
  void initState() {
    var first = widget.address;
    address.text =
        ' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}';
    // TODO: implement initState
    super.initState();
  }

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
                                width: 400,
                                height: 410,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/agentpic.png'),
                                        fit: BoxFit.cover)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        width: 400,
                                        height: 375,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/agentpic.png'),
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
                          "Are  you  an  agent ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Give details below to register as an Agent ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Text(
                                "Get Live Location".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      MapPicker(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                            controller: name,
                            decoration: ThemeHelper()
                                .textInputDecoration('Name', 'Enter your name'),
                            validator: (val) {
                              if ((val.length == 0)) {
                                return "Name cannot be empty";
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
                            controller: email,
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val.isEmpty == 0) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
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
                        Container(
                          child: TextFormField(
                            controller: mobile,
                            decoration: ThemeHelper().textInputDecoration(
                                "Mobile Number", "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if ((val.length != 10) ||
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid phone number";
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
                        Container(
                          child: TextFormField(
                            controller: agent_number,
                            decoration: ThemeHelper().textInputDecoration(
                                "Agent Number", "Enter your agent number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if ((val.length == 0) ||
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid agent number";
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
                            controller: address,
                            decoration: ThemeHelper().textInputDecoration(
                                'Address', 'Enter your address'),
                            validator: (val) {
                              if ((val.length == 0)) {
                                return " cannot be empty";
                              } else {
                                // count1++;
                              }
                              count1++;
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          child: TextFormField(
                            controller: pincode,
                            decoration: ThemeHelper().textInputDecoration(
                                "PIN Code", "Enter PIN code"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if ((val.length != 6) ||
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid PIN code";
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

                        CountryStateCityPicker(
                          country: country,
                          state: state,
                          city: city,
                          textFieldInputBorder: UnderlineInputBorder(),
                        ),
                        // SelectState(
                        //   onCountryChanged: (value) {
                        //     setState(() {
                        //       countryValue = value;
                        //     });
                        //   },
                        //   onStateChanged: (value) {
                        //     setState(() {
                        //       stateValue = value;
                        //     });
                        //   },
                        //   onCityChanged: (value) {
                        //     setState(() {
                        //       cityValue = value;
                        //     });
                        //   },
                        // ),
                        // Container(
                        //   //margin: EdgeInsets.fromLTRB(0, 0, 190, 0),
                        //   child: Center(
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Container(
                        //           //margin: EdgeInsets.fromLTRB(10, 0, 40, 0),
                        //           child: DropdownButton(
                        //             items: _states
                        //                 .map((value) => DropdownMenuItem(
                        //                       child: Text(
                        //                         value,
                        //                         style: TextStyle(),
                        //                       ),
                        //                       value: value,
                        //                     ))
                        //                 .toList(),
                        //             onChanged: (selectedAccountType) {
                        //               //count1++;
                        //               statesel = 1;
                        //               print('$selectedAccountType');
                        //               setState(() {
                        //                 selectedstate = selectedAccountType;
                        //               });
                        //             },
                        //             value: selectedstate,
                        //             isExpanded: false,
                        //             hint: Text(
                        //               'Select State',
                        //               style: TextStyle(),
                        //             ),
                        //           ),
                        //         ),
                        //         DropdownButton(
                        //           items: _states
                        //               .map((value) => DropdownMenuItem(
                        //                     child: Text(
                        //                       value,
                        //                       style: TextStyle(),
                        //                     ),
                        //                     value: value,
                        //                   ))
                        //               .toList(),
                        //           onChanged: (selectedAccountType) {
                        //             print('$selectedAccountType');
                        //             setState(() {
                        //               dissel = 1;
                        //               //count1++;
                        //               selectedType2 = selectedAccountType;
                        //             });
                        //           },
                        //           value: selectedType2,
                        //           isExpanded: false,
                        //           hint: Text(
                        //             'Select district',
                        //             //style: TextStyle(color: Color(0xff11b719)),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 15.0),
                        Text('select the services you will provide'),
                        SizedBox(height: 5.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkbox1Value,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            checkbox1Value =
                                                newValue; /////////////////
                                            count++;
                                            state.didChange(newValue);
                                          });
                                        }),
                                    Text(
                                      "Patent",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkbox1Value) {
                            } else {
                              count++;
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 0.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkbox2Value,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            checkbox2Value =
                                                newValue; /////////////////
                                            count++;
                                            state.didChange(newValue);
                                          });
                                        }),
                                    Text(
                                      "Trademark",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkbox2Value) {
                            } else {
                              count++;
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 0.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkbox3Value,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            checkbox3Value =
                                                newValue; /////////////////
                                            count++;
                                            state.didChange(newValue);
                                          });
                                        }),
                                    Text(
                                      "Copyright",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkbox3Value) {
                            } else {
                              count++;
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 0.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkbox4Value,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            checkbox4Value =
                                                newValue; /////////////////
                                            count++;
                                            state.didChange(newValue);
                                          });
                                        }),
                                    Text(
                                      "Industrial Design",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkbox4Value) {
                            } else {
                              //count++;
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              // if (statesel == 0) {
                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(SnackBar(
                              //     content: Text("Select your State first"),
                              //   ));
                              // }
                              // //count1++;
                              // else if (dissel == 0) {
                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(SnackBar(
                              //     content: Text("Select your District"),
                              //   ));
                              // }
                              //count1++;
                              print(checkbox1Value);
                              print(checkbox2Value);
                              print(checkbox3Value);
                              if (count == 0) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "You need to select atleast one service "),
                                ));
                              } else if (city.text != "" &&
                                  state.text != "" &&
                                  country.text != "") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Please select country, state and city"),
                                ));
                              } else if (_formKey.currentState.validate() &&
                                  city.text != "" &&
                                  state.text != "" &&
                                  country.text != "") {
                                FirebaseFirestore.instance
                                    .collection("agents")
                                    .add({
                                  'name': name.text,
                                  'email': email.text,
                                  'mobileno': mobile.text,
                                  'agentno': agent_number.text,
                                  'address': address.text,
                                  'pincode': pincode.text,
                                  'country': country.text,
                                  'state': state.text,
                                  'city': city.text,
                                  'latitude': widget.latitude,
                                  'longitude': widget.longitude
                                }).then((value) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => HelpPage()),
                                      (Route<dynamic> route) => false);
                                });
                              }
                            },
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
