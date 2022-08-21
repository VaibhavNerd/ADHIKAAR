import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ipr/components/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/account_images_json.dart';
import 'package:ipr/util/vaibhav_details.dart';
import 'dart:ui';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _listItem = [
    'assets/images/weekone.jpg',
    'assets/images/weektwo.jpg',
    'assets/images/drakeone.jpg',
    'assets/images/draketwo.jpg',
    'assets/images/weekone.jpg',
    'assets/images/weektwo.jpg',
    'assets/images/drakeone.jpg',
    'assets/images/draketwo.jpg',
    'assets/images/weekone.jpg',
    'assets/images/weektwo.jpg',
    'assets/images/drakeone.jpg',
    'assets/images/draketwo.jpg',
  ];
  List<String> state = [
    'The Weeknd - Sacrifice (Official Music Video)',
    'The Weeknd - Heartless (Official Video)',
    'Drake - Sticky (Official Music Video)',
    'The Weeknd - Sacrifice (Official Music Video)',
    'The Weeknd - Heartless (Official Video)',
    'Drake - Sticky (Official Music Video)',
    'The Weeknd - Sacrifice (Official Music Video)',
    'The Weeknd - Heartless (Official Video)',
    'Drake - Sticky (Official Music Video)',
    'The Weeknd - Sacrifice (Official Music Video)',
    'The Weeknd - Heartless (Official Video)',
    'Drake - Sticky (Official Music Video)',
  ];
  List<String> des = [
    '14 lakh views\n2 years ago',
    '1 crore views\n6 years ago',
    '67 lakh views\n2 months ago',
    '2 crore views\n2 years ago',
    '35 lakh views\n2 years ago',
    '62 lakh views\n2 years ago',
    '9 crore views\n2 years ago',
    '25 lakh views\n2 years ago',
    '65 lakh views\n2 years ago',
    '15 lakh views\n2 years ago',
    '14 crore views\n2 years ago',
    '75 lakh views\n2 years ago',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.voilet,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back),
        title: Center(
          child: Text(
            "Need Help ?",
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
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CustomColor.black,
                CustomColor.voilet,
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
          padding: EdgeInsets.all(11.0),
          child: Column(
            children: <Widget>[
              Text(
                "Refer  videos  below  for assistance ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Scrollbar(
                  isAlwaysShown: true,
                  interactive: true,
                  showTrackOnHover: true,
                  hoverThickness: 10,
                  thickness: 7,
                  radius: Radius.circular(7),
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 3.4 / 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: _listItem.length,
                      itemBuilder: (BuildContext ctx, index) {
                        final item = _listItem[index];
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            elevation: 3,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Image.asset(
                                      _listItem[index],
                                      height: 78.75,
                                      width: 140,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 165),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(state[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 165),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 37),
                                    child: Text(des[index],
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
