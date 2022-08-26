import 'package:flutter/material.dart';

class Noti extends StatefulWidget {
  const Noti({Key key}) : super(key: key);

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "No notifications yet",
        ),
      ),
    );
  }
}
