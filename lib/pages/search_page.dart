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

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _listItem = [
    'assets/images/patentFile.jpg',
    'assets/images/xyz2.jpg',
    'assets/images/xyz3.jpg',
    'assets/images/xyz4.jpg',
    'assets/images/copy.jpg',
    'assets/images/patentFile.jpg',
    'assets/images/patentFile.jpg',
    'assets/images/xyz2.jpg',
    'assets/images/xyz3.jpg',
    'assets/images/xyz4.jpg',
    'assets/images/xyz5.jpg',
    'assets/images/patentFile.jpg',
    
    
  ];
  List<String> state = [
    'Early publication of patent application in India | Form 09 | Indian Patent Application form',
    'पेटेंट क्या है? | पेटेंट की मूल बातें । What is patent? | Basics of Patent in India.',
    'Indian Patent Application form | Form 1 | How to file a Patent in India ?',
    'Indian Patent Application form | Form 2 | How to file a Patent in India ?',
    'What is Copyright ? | Basics of Copyright. | Basic Of IPR S01-L04.',
    'What is TradeMark? | Basics of TradeMark | Basic Of IPR S01-L02',
    'Early publication of patent application in India | Form 09 | Indian Patent Application form',
    'पेटेंट क्या है? | पेटेंट की मूल बातें । What is patent? | Basics of Patent in India.',
    'Indian Patent Application form | Form 1 | How to file a Patent in India ?',
    'Indian Patent Application form | Form 2 | How to file a Patent in India ?',
    'What is Copyright ? | Basics of Copyright. | Basic Of IPR S01-L04.',
    'What is TradeMark? | Basics of TradeMark | Basic Of IPR S01-L02',
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
  List<String> links = [
    'https://www.youtube.com/watch?v=wloasftYUkA&list=PLJYztO8E6QrOz_dxSr0wohpZGkMAes9gA&index=5',
    'https://www.youtube.com/watch?v=5GTr2wLlCik',
    'https://www.youtube.com/watch?v=BOrgpIGaL0c',
    'https://www.youtube.com/watch?v=qvmRoIb--ww',
    'https://www.youtube.com/watch?v=weROn0C7FDc',
    'https://www.youtube.com/watch?v=3_wbXWMAsTY',
    'https://www.youtube.com/watch?v=hZfQvWmPHVw&list=PLJYztO8E6QrOz_dxSr0wohpZGkMAes9gA&index=4',
    'https://www.youtube.com/watch?v=wloasftYUkA&list=PLJYztO8E6QrOz_dxSr0wohpZGkMAes9gA&index=5',
    'https://www.youtube.com/watch?v=s1YBZ2wkKGE',
    'https://www.youtube.com/watch?v=8PugBEisXuA&ab_channel=MYCrave',
    'https://www.youtube.com/watch?v=w6OrQVJX56w',
    'https://www.youtube.com/watch?v=4CHYcAND32Q&ab_channel=SonamGedaandCompany',
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
                                          vertical: 10, horizontal: 10),
                                      child: Image.asset(
                                        _listItem[index],
                                        height: 78.75,
                                        width: 140,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
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
