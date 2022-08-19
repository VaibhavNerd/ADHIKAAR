import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/Activity_json.dart';
import 'package:ipr/util/story_json.dart';


class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(size),
      body: getBody(size),


    );
  }
}
Widget getAppBar(size) {



}

Widget getBody(size) {
  return Scaffold(
    body: Center(child: Text("Activity")),
  );

      }
