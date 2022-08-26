import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipr/pages/aadhar_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipr/pages/account_page.dart';
import 'package:ipr/pages/activity_page.dart';
import 'package:ipr/pages/agent_register.dart';
import 'package:ipr/pages/faq.dart';
import 'package:ipr/pages/lang.dart';
import 'package:ipr/pages/login_screen.dart';
import 'package:ipr/market/buyNational.dart';
//<<<<<<< vaibhav

import 'package:ipr/pages/patent.dart';
import 'package:ipr/pages/patent_guidlines.dart';
import 'package:ipr/pages/raise.dart';
import 'package:ipr/pages/search_district.dart';
import 'package:ipr/pages/search_page.dart';
import 'package:ipr/pages/search_pin.dart';

import 'package:ipr/pages/trade.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ipr/pages/home_page.dart';
import 'package:ipr/pages/root_app.dart';
import 'package:ipr/pages/sign_in_page.dart';

import 'market/new_post_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('hi', 'IN')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
  // runApp(MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: Home(),
  //   theme: ThemeData(
  //     textTheme: GoogleFonts.poppinsTextTheme(),
  //   ),
  // ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
// =======
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: RootApp(),
//     theme: ThemeData(
//       textTheme: GoogleFonts.poppinsTextTheme(),
//     ),
//   ));
// >>>>>>> 989df521b2ec99dced1171d632554ede6e90140b
// }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// <<<<<<< HEAD
  @override
  void initState() {
    // FirebaseAuth.instance.signOut();
    Timer(Duration(seconds: 4), () async {
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/splashscreen/lion1.png",
                    width: 44,
                    height: 60,
                  ),
                  Image.asset("assets/images/splashscreen/dg.png",
                      width: 80, height: 100),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Image.asset(
                "assets/images/splashscreen/rogo1.png",
                width: size.width - 30,
                height: 250,
              ),
            ),
            Container(
              child: Image.asset(
                "assets/images/splashscreen/adhi.png",
                width: size.width - 100,
                height: 200,
              ),
            ),
            Container(
              child: Text(
                "Imaginative Inadia\nInnovative India\nCreative India",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
