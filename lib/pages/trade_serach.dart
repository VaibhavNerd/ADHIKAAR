import  'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Tm_Search extends StatefulWidget {
  const Tm_Search({Key key}) : super(key: key);

  @override
  State<Tm_Search> createState() => _Tm_SearchState();
}

class _Tm_SearchState extends State<Tm_Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: WebView(initialUrl: "https://branddb.wipo.int/branddb/en/",
        javascriptMode: JavascriptMode.unrestricted,),

    );
  }
}
