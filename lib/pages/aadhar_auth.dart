import 'package:checkdigit/checkdigit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:ipr/pages/account_page.dart';
import 'package:ipr/pages/activity_page.dart';
import 'package:ipr/pages/agent_register.dart';
import 'package:ipr/pages/home_page.dart';
import 'package:ipr/pages/new_post_page.dart';
import 'package:ipr/pages/search_page.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/bottom_navigation_bar_json.dart';

import 'otp.dart';

class AadharAuth extends StatefulWidget {
  @override
  _AadharAuthState createState() => _AadharAuthState();
}

class _AadharAuthState extends State<AadharAuth> {
  int indexPage = 0;
  bool isValid;
  TextEditingController phone_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F9),
      body: getBody(),
    );
  }

  Widget getBody() {
    isValid = verhoeff.validate("222936894577");
    print(isValid);
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  isValid.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+91'),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: phone_controller,
              ),
            )
          ]),
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            OTPScreen(phone_controller.text)));
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              RegistrationPage(Address(), 0, 0)),
                    );
                  },
                  child: Text("Login as Agent")),
            ],
          )
        ],
      ),
    );
  }
}
