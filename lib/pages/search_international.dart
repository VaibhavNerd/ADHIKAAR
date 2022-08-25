import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ipr/chat_bot.dart';
import 'package:ipr/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ipr/pages/agentlist.dart';
import 'package:ipr/pages/list_international_buy.dart';
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
import 'package:http/http.dart' as http;

class SearchInternationalIPR extends StatefulWidget {
  SearchInternationalIPR(this.val);
  String val;
  @override
  State<SearchInternationalIPR> createState() => _SearchInternationalIPRState();
}

class _SearchInternationalIPRState extends State<SearchInternationalIPR> {
  TextEditingController name = TextEditingController();
  List agent = [];
  Future<void> checkbypincode(String searchtext) async {
    agent = [];
    var headers = {'accept': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://developer.uspto.gov/ipmarketplace-api/search/query?searchText=$searchtext'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());
      log(data["results"].length.toString());
      setState(() {
        agent = (data["results"]);
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  final _formKey = GlobalKey<FormState>();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back),
        title: Center(
          child: Text(
            "Search by Patent Name",
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
                          image: AssetImage('assets/images/pinman.png'),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Text(
                    "To search IPR by name,\n search here",
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
                Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextFormField(
                    controller: name,
                    decoration:
                        ThemeHelper().textInputDecoration("Name", "Enter Name"),
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      if (val.length < 3) {
                        return 'Enter atleast three letters';
                      }
                      return null;
                    },
                  ),
                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
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
                          checkbypincode(name.text).then((value) {
                            print(agent);
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    InternationalBuy(agent),
                              ),
                            );
                          });
                          //     showDialog<String>(
                          //       context: context,
                          //       builder: (BuildContext context) => AlertDialog(
                          //         title: const Text('Agent Details'),
                          //         content: const Text(
                          //             'Name : Sankalp Srivastava \nMobile no.: 6387248986\nAddress:1054 , Pinewood Enclave Wave City , Ghaziabad -201015'),
                          //         actions: <Widget>[
                          //           TextButton(
                          //             onPressed: () =>
                          //                 Navigator.pop(context, 'Cancel'),
                          //             child: const Text('Cancel'),
                          //           ),
                          //           TextButton(
                          //             onPressed: () => Navigator.pop(context, 'OK'),
                          //             child: const Text('OK'),
                          //           ),
                          //         ],
                          //       ),
                          //     );
                          //   }
                          // },
                        }
                      }),
                ),
                // Expanded(
                //   child: GridView.builder(
                //       gridDelegate:
                //           const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 1,
                //         childAspectRatio: 6 / 1,
                //         crossAxisSpacing: 10,
                //         mainAxisSpacing: 10,
                //       ),
                //       itemCount: _listItem.length,
                //       itemBuilder: (BuildContext ctx, index) {
                //         final item = _listItem[index];
                //         return Container(
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(15.0),
                //             ),
                //             color: Colors.white,
                //             elevation: 3,
                //             child: InkWell(
                //               onTap: () {
                //                 Navigator.push(
                //                   context,
                //                   MaterialPageRoute<void>(
                //                     builder: (BuildContext context) =>
                //                         ChatScreen(),
                //                   ),
                //                 );
                //               },
                //               child: Stack(
                //                 children: <Widget>[
                //                   Container(
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(20),
                //                     ),
                //                     child: Padding(
                //                       padding: EdgeInsets.symmetric(
                //                           vertical: 10, horizontal: 20),
                //                       child: Image.asset(
                //                         _listItem[index],
                //                         height: 70,
                //                         width: 35,
                //                         fit: BoxFit.fill,
                //                       ),
                //                     ),
                //                   ),
                //                   Container(
                //                     margin: EdgeInsets.symmetric(
                //                         vertical: 7, horizontal: 70),
                //                     child: Text(state[index],
                //                         style: TextStyle(
                //                             fontSize: 20,
                //                             fontWeight: FontWeight.bold)),
                //                   ),
                //                   Container(
                //                     margin: EdgeInsets.only(left: 70),
                //                     child: Padding(
                //                       padding: const EdgeInsets.only(top: 27),
                //                       child: Text(des[index],
                //                           style: TextStyle(
                //                             fontSize: 15,
                //                           )),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         );
                //       }),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
