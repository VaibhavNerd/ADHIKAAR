import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipr/chat_bot.dart';
import 'package:ipr/pages/blogs/blogs.dart';
import 'package:ipr/pages/blogs/uploadblog.dart';
import 'package:ipr/pages/chat_page.dart';
import 'package:http/http.dart' as http;
import 'package:ipr/pages/copyright.dart';
import 'package:ipr/pages/notification.dart';
import 'package:ipr/pages/trade.dart';
// <<<<<<< HEAD
import 'package:ipr/patent_forms/ongoing_form.dart';

import 'package:ipr/pages/patent.dart';

import 'dart:math' as math;
import 'package:ipr/theme/colors.dart';

import 'package:ipr/util/new_feed_json.dart';
import 'package:ipr/util/story_json.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../services/firebase_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _tweetList = [
    'assets/images/tweet2.jpeg',
    'assets/images/tweet1.jpeg'
        'assets/images/tweet2.jpeg',
    'assets/images/tweet1.jpeg'
  ];
  Widget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/images/idealLogoNew.svg", width: 90),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print(context.locale.toString());
                      context.locale.toString() == "hi_IN"
                          ? context.setLocale(Locale('en', 'US'))
                          : context.setLocale(Locale('hi', 'IN'));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      child: Text(
                          context.locale.toString() == "hi_IN" ? "ENG" : "HIN"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Noti()));
                      },
                      child: Container(
                        child: Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    print(DateTime.now().toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: CircleAvatar(
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ChatScreen()));
            },
            child: Container(child: Icon(Icons.question_answer))),
      ),
      backgroundColor: Color(0xFFBEFF0F9),
      appBar: getAppBar(),
      body: getBody(size),
    );
  }

  Widget getBody(size) {
    return ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Container(
            width: size.width,
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            decoration: BoxDecoration(
                // color: Colors.lightBlue,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                      height: 172.0, autoPlay: true, viewportFraction: 1),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: size.width,
                          //color: Colors.cyanAccent,
                          margin: const EdgeInsets.only(top: 0),
                          height: 172,

                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: size.width,
                                height: 150,
                                margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      blurRadius: 5,
                                      offset: Offset(5, 5),
                                    ),
                                    BoxShadow(
                                      //color: Color.fromRGBO(255, 255, 255, 1),
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      blurRadius: 10,

                                      offset: Offset(-5, -5),
                                    )
                                  ],
                                  color: Color(0xFFB375FC8),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      margin: const EdgeInsets.fromLTRB(
                                          30, 0, 0, 0),
                                      decoration: BoxDecoration(
                                          // color: Colors.amberAccent,
                                          ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                                //  color: Colors.greenAccent,
                                                ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 15, 0, 0),
                                              child: GradientText(
                                                "Intellectual Property",
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize: 18),
                                                colors: [
                                                  Colors.orange,
                                                  Colors.white,
                                                  Colors.green,
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                  //  color: Colors.greenAccent,
                                                  ),
                                              child: Row(children: <Widget>[
                                                Expanded(
                                                    child: Divider(
                                                  thickness: 1.5,
                                                  color: Colors.white,
                                                )),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  "RIGHTS",
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    color: Color(0xFFBFFFFFF),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                    child: Divider(
                                                  thickness: 2,
                                                  color: Colors.white,
                                                )),
                                              ])),

                                          SizedBox(
                                            width: double.infinity,
                                            height: 4,
                                          ),

                                          // Padding(padding:  ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            width: 140,
                                            child: Text(
                                              "You are in safe hand",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Color(0xFFBFFFFFF),
                                              ),
                                            ).tr(),
                                            decoration: BoxDecoration(
                                                //  color: Colors.deepOrange

                                                ),
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Intellectual property, more than ever, is a line drawn around information",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 7,
                                                color: Color(0xFFBFFFFFF),
                                              ),
                                            ).tr(),
                                            decoration: BoxDecoration(
                                                //    color: Colors.deepOrange

                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0.5,
                                right: 1,
                                child: Container(
                                    width: 145,
                                    height: 182,
                                    decoration: BoxDecoration(
                                      //  color: Colors.black,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/lion3.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  height: 24,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Our Services",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ).tr(),
                  ),
                  decoration: BoxDecoration(),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: size.width,

                  // color: Colors.green,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
//<<<<<<< HEAD

// =======
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => Patent(),
// >>>>>>> master
                                ),
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 188,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 7,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/patentpic1.jpg'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          color: Color(0xFFEFF0F9),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: double.infinity,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 3, 0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Patent",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ).tr(),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Legal Right Of Owner",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 45)),
                                                  ).tr(),
                                                ),
                                              ],
                                            )),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          color: Color(0xFFF8F7FC),
                                        ),
                                      )),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 5,
                                    offset: Offset(5, 5),
                                  ),
                                  BoxShadow(
                                    //color: Color.fromRGBO(255, 255, 255, 1),
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    blurRadius: 10,

                                    offset: Offset(-5, -5),
                                  )
                                ],
                                // color: Colors.amberAccent,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      Copyright(),
// >>>>>>> master
                                ),
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 188,
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 7,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/copypic1.jpg'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          color: Color(0xFFEFF0F9),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: double.infinity,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 3, 0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Copyright",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ).tr(),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Prevent unathorized use",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 45)),
                                                  ).tr(),
                                                ),
                                              ],
                                            )),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          color: Color(0xFFF8F7FC),
                                        ),
                                      ))
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 5,
                                    offset: Offset(5, 5),
                                  ),
                                  BoxShadow(
                                    //color: Color.fromRGBO(255, 255, 255, 1),
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    blurRadius: 10,

                                    offset: Offset(-5, -5),
                                  )
                                ],
                                //    color: Colors.amberAccent,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Trade(),
// >>>>>>> master
                      ),
                    );
                  },
                  child: Container(
                    width: size.width,
                    margin: EdgeInsets.only(top: 10),
                    //color: Colors.green,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 96,
                              height: 122,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 7,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/tradepic1.jpg'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          color: Color(0xFFEFF0F9),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: double.infinity,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 8, 0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Trademark",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ).tr(),
                                                ),
                                              ],
                                            )),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          color: Color(0xFFF8F7FC),
                                        ),
                                      )),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 3,
                                    offset: Offset(3, 3),
                                  ),
                                  BoxShadow(
                                    //color: Color.fromRGBO(255, 255, 255, 1),
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    blurRadius: 3,

                                    offset: Offset(-3, -3),
                                  )
                                ],
                                // color: Colors.amberAccent,
                              ),
                            ),
                            Container(
                              width: 96,
                              height: 122,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 7,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/industrypic1.jpg'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          color: Color(0xFFEFF0F9),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: double.infinity,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 8, 0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Industrial Design",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ).tr(),
                                                ),
                                              ],
                                            )),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          color: Color(0xFFF8F7FC),
                                        ),
                                      )),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 3,
                                    offset: Offset(3, 3),
                                  ),
                                  BoxShadow(
                                    //color: Color.fromRGBO(255, 255, 255, 1),
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    blurRadius: 3,

                                    offset: Offset(-3, -3),
                                  )
                                ],
                                // color: Colors.amberAccent,
                              ),
                            ),
                            Container(
                              width: 96,
                              height: 122,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 7,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/geopic1.jpg'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          color: Color(0xFFEFF0F9),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: double.infinity,
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 4, 0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Geographical identification",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ).tr(),
                                              ],
                                            )),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          color: Color(0xFFF8F7FC),
                                        ),
                                      )),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 3,
                                    offset: Offset(3, 3),
                                  ),
                                  BoxShadow(
                                    //color: Color.fromRGBO(255, 255, 255, 1),
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    blurRadius: 3,

                                    offset: Offset(-3, -3),
                                  )
                                ],
                                // color: Colors.amberAccent,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Blogs(),
                      ),
                    );
                  },
                  child: Container(
                    width: size.width,
                    // color: Colors.cyanAccent,
                    margin: const EdgeInsets.only(top: 0),
                    height: 172,

                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: size.width,
                          height: 150,
                          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                blurRadius: 5,
                                offset: Offset(5, 5),
                              ),
                              BoxShadow(
                                //color: Color.fromRGBO(255, 255, 255, 1),
                                color: Color.fromRGBO(255, 255, 255, 1),
                                blurRadius: 10,

                                offset: Offset(-5, -5),
                              )
                            ],
                            color: Color(0xFFBA6C6F7),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: 180,
                                margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                decoration: BoxDecoration(
                                    // color: Colors.amberAccent,
                                    ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          //  color: Colors.greenAccent,
                                          ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 15, 0, 0),
                                        child: SvgPicture.asset(
                                            "assets/images/verifygov.svg"),
                                      ),
                                    ),

                                    SizedBox(
                                      width: double.infinity,
                                      height: 4,
                                    ),

                                    // Padding(padding:  ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      width: 180,
                                      child: Text(
                                        "Blog Section",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(0xFFBFFFFFF),
                                        ),
                                      ).tr(),
                                      decoration: BoxDecoration(
                                          //  color: Colors.deepOrange

                                          ),
                                    ),

                                    Container(
                                      width: 100,
                                      height: 30,
                                      margin:
                                          const EdgeInsets.fromLTRB(2, 8, 0, 0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("Enter",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                            textAlign: TextAlign.center).tr(),
                                      ),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.4),
                                              blurRadius: 1,
                                              offset: Offset(2, 2),
                                            ),
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.3),
                                              blurRadius: 5,
                                              offset: Offset(-1.5, -1.5),
                                            )
                                          ],
                                          color: Color(0xFFBA6C6F7),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  bottom: 5,
                                  right: 1,
                                  child: Container(
                                    width: 145,
                                    height: 130,
                                    child: SvgPicture.asset(
                                        "assets/images/man.svg"),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  // color: Colors.cyanAccent,
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  height: 120,

                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: size.width,
                        // height: 200,
                        //margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              // width: 400,
                              //margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                              decoration: BoxDecoration(
                                  // color: Colors.amberAccent,
                                  ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: double.infinity,
                                    height: 4,
                                  ),

                                  // Padding(padding:  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "66,440",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "The number of patent filings in india ",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 45)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  "3.27 million",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "The number of patent applications worldwide",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 45)),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                      Column(
                                        children: [],
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [],
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
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 4, 0, 5),
                  height: 24,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "#FileYourIPR",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ).tr(),
                  ),
                  decoration: BoxDecoration(),
                ),
                SizedBox(
                  height: 0,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 160.0,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayInterval: Duration(seconds: 1),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Image.asset('assets/images/tweet1.jpeg');
                  }).toList(),
                ),
              ],
            ),
          ),
        ]);
  }
}
