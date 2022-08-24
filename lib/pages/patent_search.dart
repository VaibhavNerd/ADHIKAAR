import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../theme/colors.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController _controller;
  WebViewController _controller2;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: WillPopScope( onWillPop:() async
        {
          if (await _controller.canGoBack()) {
            _controller.goBack();
            return false;
          }

          else {
            return true;
          }
        },child:

          Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Row( children:[
                GestureDetector( onTap: (){ if (_controller != null) {
                  _controller.loadUrl("https://patentscope.wipo.int/search/en/search.jsf");}},
                  child:
                  Container(
                    width: 0.4*size.width,
                    height: 40,
                    child: Text("KeyWord"),

                    color: Colors.white12,
                  ),
                ),
                GestureDetector( onTap: (){ if (_controller != null) {
                  _controller.loadUrl("https://ipindiaservices.gov.in/publicsearch");}},
                  child:
                  Container(
                    width: 0.4*size.width,
                    height: 20,
                    color: Colors.white12,
                    child: Text("Attributes"),
                  ),
                ),
              ]),

              // onTap: () {
              //   if (_controller != null) {
              //     _controller.loadUrl(pages[index]);
              //   }
              // },
              //     );
              //   },
              // ),
              // ),
              Expanded(
                child: WebView(
                  onWebViewCreated: (WebViewController c) {
                    _controller = c;
                  },
                  initialUrl: 'https://patentscope.wipo.int/search/en/search.jsf',
                ),
              ),
            ],
          ),
        ),);
  }
}