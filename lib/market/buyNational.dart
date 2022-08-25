import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ipr/components/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ipr/pages/home_page.dart';
import 'package:ipr/pages/root_app.dart';
import 'package:ipr/pages/you_player.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/account_images_json.dart';
import 'package:ipr/util/vaibhav_details.dart';
import 'dart:ui';

class BuyNational extends StatefulWidget {
  @override
  _BuyNationalState createState() => _BuyNationalState();
}

class _BuyNationalState extends State<BuyNational> {
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
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
  ];
  List<String> des = [
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
  ];
  List<String> links = [
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=bNtOvlT9ZCQ&list=RDbNtOvlT9ZCQ&start_radio=1',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
  ];
  String linktosend = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.voilet,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            splashRadius: 15,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RootApp()));
            }),
        title: Center(
          child: Text(
            "Buy IPRs",
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
                "Choose IPRs from below to buy them",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
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
                        return InkWell(
                          onTap: () {
                            linktosend = links[index];
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    Yplayer(linktosend),
                              ),
                            );
                          },
                          child: Container(
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
                                          vertical: 10, horizontal: 20),
                                      child: Image.asset(
                                        'assets/images/diploma.png',
                                        height: 78.75,
                                        width: 80,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 120),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(state[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 120),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 37),
                                      child: Text(des[index],
                                          style: TextStyle(
                                            fontSize: 13,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(120, 47, 0, 0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "BUY",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.lightBlue,
                                          minimumSize: Size(15, 25)),
                                    ),
                                  )
                                ],
                              ),
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
