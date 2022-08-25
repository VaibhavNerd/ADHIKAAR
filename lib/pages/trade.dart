import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipr/pages/faq.dart';
import 'package:ipr/pages/home_page.dart';
import 'package:ipr/pages/patent_guidlines.dart';
import 'package:ipr/pages/submittedapplication.dart';
import 'package:ipr/pages/trade_serach.dart';
import 'package:ipr/pdf/secondPage.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../patent_forms/ongoing_form.dart';
import '../services/firebase_services.dart';
import 'chat_page.dart';

class Trade extends StatefulWidget {
  const Trade({Key key}) : super(key: key);

  @override
  State<Trade> createState() => _TradeState();
}

class _TradeState extends State<Trade> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFBEFF0F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          
            onTap:
            () {
              Navigator.pop(context);
            },
         
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            "Trademark",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
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
              child: Center(
                  child: Icon(
                Icons.menu,
                color: Colors.black,
              )),
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
        child:GestureDetector( onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute<void>(
              builder: (BuildContext context) =>
              Tm_Search(),
          ),
          );
        },
          child:  Container(
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
          ),
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
                                                "New Application no.",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
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
                                                "Submitted Application",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
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
                                                "Guidlines",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
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
                                                ),
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
            Padding(
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
                                    image: AssetImage('assets/images/form.png'),
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
                                          padding:
                                              EdgeInsets.fromLTRB(0, 15, 0, 0),
                                          child: Center(
                                            child: Text(
                                              "Forms and fees",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
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
                                      image:
                                          AssetImage('assets/images/faqq.png'),
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
                                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Text(
                                              "FAQ",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
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
          ],
        ),
      ),
    ]);
  }
}
