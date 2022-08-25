import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipr/pages/aadhar_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipr/pages/activity_page.dart';
import 'package:ipr/pages/agent_register.dart';
import 'package:ipr/pages/faq.dart';
import 'package:ipr/pages/lang.dart';
import 'package:ipr/pages/login_screen.dart';
import 'package:ipr/pages/new_post_page.dart';
//<<<<<<< vaibhav

import 'package:ipr/pages/patent.dart';
import 'package:ipr/pages/patent_guidlines.dart';
import 'package:ipr/pages/raise.dart';
import 'package:ipr/pages/search_district.dart';
import 'package:ipr/pages/search_page.dart';
import 'package:ipr/pages/search_pin.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ipr/pages/home_page.dart';
import 'package:ipr/pages/root_app.dart';
import 'package:ipr/pages/sign_in_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// <<<<<<< HEAD
  @override
  void initState() {
    // FirebaseAuth.instance.signOut();
    Timer(Duration(seconds: 2), () async {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AadharAuth()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RootApp()));
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
