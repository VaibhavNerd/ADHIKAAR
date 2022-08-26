import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipr/pages/all_payments.dart';
import 'package:ipr/pages/faq.dart';
import 'package:ipr/pages/home_page.dart';
import 'package:ipr/pages/patent_guidlines.dart';
import 'package:ipr/pages/patent_search.dart';
import 'package:ipr/pages/submittedapplication.dart';
import 'package:ipr/pdf/secondPage.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../patent_forms/ongoing_form.dart';
import '../services/firebase_services.dart';
import 'chat_page.dart';

class Patent extends StatefulWidget {
  const Patent({Key key}) : super(key: key);

  @override
  State<Patent> createState() => _PatentState();
}

class _PatentState extends State<Patent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFBEFF0F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            "Patent",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ).tr(),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: InkWell(
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
          )
        ],
      ),
      body: getBody(size),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/images/logo.svg", width: 90),
              IconButton(
                  splashRadius: 15,
                  icon: Icon(FontAwesome5Brands.facebook_messenger),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => ChatPage()));
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(size) {
    return ListView(shrinkWrap: true, children: [
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => MyHomePage(),
              ),
            );
          },
          child: Container(
            height: 40,
            width: 50,
            child: Text(
              'Search',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                height: 1.85,
                fontSize: 20,
              ),
            ).tr(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        width: size.width,
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
            // color: Colors.lightBlue,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        String applicationid = await createnewformforuser();
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  OngoingForms(applicationid),
                            ));
                      },
                      child: Container(
                        width: 0.45 * size.width,
                        height: 200,
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
                                          'assets/images/newapp.png'),
                                      fit: BoxFit.contain,
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
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 15, 0, 0),
                                            child: Center(
                                              child: Text(
                                                "New Application",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ).tr(),
                                            ),
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
                                SubmittedApplication(),
                          ),
                        );
                      },
                      child: Container(
                        width: 0.45 * size.width,
                        height: 200,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/subapp.png'),
                                      fit: BoxFit.contain,
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
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 15, 0, 0),
                                            child: Center(
                                              child: Text(
                                                "Sub. Application",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ).tr(),
                                            ),
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
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => PatentGuide(),
                  ),
                );
              },
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 0.45 * size.width,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/guide.png'),
                                      fit: BoxFit.contain,
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
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 15, 0, 0),
                                            child: Center(
                                              child: Text(
                                                "Guidelines",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ).tr(),
                                            ),
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => PDF(),
                            ),
                          );
                        },
                        child: Container(
                          width: 0.45 * size.width,
                          height: 200,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 7,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/journal.png'),
                                        fit: BoxFit.contain,
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
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 15, 0, 0),
                                              child: Center(
                                                child: Text(
                                                  "Journal",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ).tr(),
                                              ),
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
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AllPayment(),
                  ),
                );
              },
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 0.45 * size.width,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/form.png'),
                                      fit: BoxFit.contain,
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
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 15, 0, 0),
                                            child: Center(
                                              child: Text(
                                                "Forms and Fees",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ).tr(),
                                            ),
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => faqPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 0.45 * size.width,
                          height: 200,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 7,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/faqq.png'),
                                        fit: BoxFit.contain,
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
                                            EdgeInsets.fromLTRB(0, 15, 0, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                "FAQ",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
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
          ],
        ),
      ),
    ]);
  }
}
