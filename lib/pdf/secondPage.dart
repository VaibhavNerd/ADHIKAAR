import 'package:flutter/material.dart';
import 'package:ipr/pdf/Journal1.dart';
import 'package:ipr/pdf/Journal2.dart';
import 'package:ipr/pdf/Journal3.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/colors.dart';
import '../pages/patent.dart';
import 'Journal4.dart';
import 'Journal5.dart';
import 'Journal6.dart';
import 'Journal7.dart';


class PDF extends StatefulWidget {
  const PDF({Key key}) : super(key: key);

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {

  _launch_url(url) async
  {
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw "error $url";
    }
  }


    final List<String> _pdf_pic = [
      'assets/images/word_file.png',
      'assets/images/word_file.png',
      'assets/images/word_file.png',

    ];
    List<String> pdf_name = [
      'Journal',
      'Journal',
      'Journal',

    ];
  final List<String> _pdf_pic2 = [
    'assets/images/word_file.png',
    'assets/images/word_file.png',
    'assets/images/word_file.png',
    'assets/images/word_file.png',
  ];
  List<String> pdf_name2 = [
    'Journal',
    'Journal',
    'Journal',
    'Journal',
  ];

 int x ;


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Colors.black),
          title: Center(
            child: Text(
              "Journal PDF ?",
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container( //color: Colors.red,
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
          child: SafeArea(
            child: Container( //color: Colors.green,
              padding: EdgeInsets.all(19.0),
              child: Column(
                children: <Widget>[

                  SizedBox(
                    height: 20,
                  ),
                  Container(height: 30, //color: Colors.red,
                    child: Text("Date - 18/08/22",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),),
                  SizedBox(height: 10,),
                  Container( height: 250,
                    child: GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 6 / 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: _pdf_pic.length,
                        itemBuilder: (BuildContext ctx, index) {

                          return Container( //color: Colors.blue,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Color.fromRGBO(220, 220, 220, 1),
                              elevation: 3,
                              child: InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              PDFview()),
                                    );
                                  }
                                  else if (index == 1) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              PDFview2()),
                                    );
                                  }
                                  else if (index == 2) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            PDFview3(),
                                      ),
                                    );
                                  }
                                },




                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        //color: Colors.red,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        child: Image.asset(
                                          _pdf_pic[index],
                                         // color: Colors.red,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Flexible(child: Container(
                                      margin: EdgeInsets.only(
                                          top: 11,left: 90,right: 10),
                                      child: Text(pdf_name[index],
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    ),

                                  ],
                                ),

                            ),
                            ),
                          );
                           } ),
                              ),
                  Container(height: 30, //color: Colors.red,
                  child: Text("Date - 18/08/22",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),),
                  SizedBox(height: 10,),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 6 / 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: _pdf_pic2.length,
                        itemBuilder: (BuildContext ctx, index) {
                         // final item = _listItem[index];
                          return Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Color.fromRGBO(220, 220, 220, 1),
                              elevation: 3,
                              child: InkWell(

                                onTap: () {
                                  if (index == 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              PDFview4()),
                                    );
                                  }
                                  else if (index == 1) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              PDFview5()),
                                    );
                                  }
                                  else if (index == 2) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            PDFview6(),
                                      ),
                                    );
                                  }
                                  else if (index == 3) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            PDFview7(),
                                      ),
                                    );
                                  }
                                },
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
                                         _pdf_pic2[index],
                                          height: 70,
                                          width: 35,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Flexible(child: Container(
                                      margin: EdgeInsets.only(
                                          top: 11,left: 90,right: 10),
                                      child: Text(pdf_name2[index],
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                           ] ),
                          ),
                        ),
                  ),
      );


    }
  }


