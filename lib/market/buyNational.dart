import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ipr/components/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ipr/pages/home_page.dart';
import 'package:ipr/pages/root_app.dart';
import 'package:ipr/pages/you_player.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/account_images_json.dart';
import 'package:ipr/util/vaibhav_details.dart';
import 'dart:ui';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class BuyNational extends StatefulWidget {
  BuyNational(this.val);
  String val;
  @override
  _BuyNationalState createState() => _BuyNationalState();
}

class _BuyNationalState extends State<BuyNational> {
  Razorpay _razorpay;
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  int selected = 0;
  void openCheckout(String amount) async {
    var options = {
      'key': "rzp_test_o1QrJ7wZrJv947",
      'amount': double.parse(amount) * 100,
      'name': 'IPR License ',
      'description': 'Purchase fee',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      //  'prefill': {'contact': phone, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log('Success Response: $response');
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, toastLength: Toast.LENGTH_SHORT);
    setState(() {
      iprs[selected]["sell"] = 0;
      iprs[selected]["issold"] = true;
      iprs[selected]["price"] = null;
    });

    Future.wait([
      FirebaseFirestore.instance
          .doc(("users/${iprs[selected]["uid"]}/forms/${iprs[selected]["id"]}"))
          .set({
        "sell": 2,
      }, SetOptions(merge: true)),
      FirebaseFirestore.instance
          .doc(
              ("users/${FirebaseAuth.instance.currentUser.uid}/forms/${iprs[selected]["id"]}"))
          .set(iprs[selected], SetOptions(merge: true)),
      FirebaseFirestore.instance.collection(("Payments/")).add({
        "paymentId": response.paymentId,
        "reason": "IPR Purchase",
        "id": iprs[selected]["id"],
        'uid': FirebaseAuth.instance.currentUser.uid,
        "time": DateTime.now().toString()
      })
    ]).then((value) async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => BuyNational(widget.val),
        ),
      );
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Error Response: $response');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var measure;
  List iprs = [];
  Future<void> getdata() async {
    print("I am here");
    String field = widget.val == "Patent"
        ? "patent"
        : widget.val == "Trademark"
            ? "trademark"
            : widget.val == "Copyright"
                ? "copyright"
                : "industrydesign";
    print(field);
    // QuerySnapshot qsnap =
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((value) async {
      for (var element in value.docs) {
        print(element.id);
        QuerySnapshot formssnap = await FirebaseFirestore.instance
            .collection("/users/${element.id}/forms")
            .where("sell", isEqualTo: 1)
            .get();
        for (var element in formssnap.docs) {
          print(element.id);
          Map<String, dynamic> data = {};
          data = element.data();
          data.addAll({"id": element.id});
          setState(() {
            iprs.add(data);
          });
        }
        QuerySnapshot formssnap1 = await FirebaseFirestore.instance
            .collection("/users/${element.id}/forms")
            .where("sell", isEqualTo: 3)
            .get();
        for (var element in formssnap1.docs) {
          print(element.id);
          Map<String, dynamic> data = {};
          data = element.data();
          data.addAll({"id": element.id});
          setState(() {
            iprs.add(data);
          });
        }
      }
    });
  }

  @override
  void initState() {
    getdata();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.voilet,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            splashRadius: 15,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RootApp()));
            }),
        title: Center(
          child: Text(
            "Buy IPRs",
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
              child: Center(child: Icon(Icons.menu)),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CustomColor.black,
                CustomColor.voilet,
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
          padding: EdgeInsets.all(11.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Choose IPRs from below to buy them",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: iprs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            elevation: 3,
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
                                      'assets/images/diploma.png',
                                      height: 78.75,
                                      width: 80,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 120),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                        "Name: ${(iprs[index]["form1"] ?? {})["title_of_invention"] ?? ""}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 120),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 37),
                                    child: Text("Id: ${iprs[index]["id"]}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                ),
                                iprs[index]["sell"] == 1
                                    ? Container(
                                        margin: EdgeInsets.only(left: 120),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 55),
                                          child: Text(
                                              "Price: ${iprs[index]["price"]}",
                                              style: TextStyle(
                                                fontSize: 13,
                                              )),
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(left: 120),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 55),
                                          child: Text(
                                              "Highest Bid: ${iprs[index]["highestbid"] ?? 0}",
                                              style: TextStyle(
                                                fontSize: 13,
                                              )),
                                        ),
                                      ),
                                iprs[index]["sell"] == 1
                                    ? Container(
                                        margin:
                                            EdgeInsets.fromLTRB(120, 70, 0, 0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              selected = index;
                                            });
                                            openCheckout(iprs[index]["price"]
                                                .toString());
                                          },
                                          child: Text(
                                            "BUY",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.lightBlue,
                                              minimumSize: Size(15, 25)),
                                        ),
                                      )
                                    : Container(
                                        margin:
                                            EdgeInsets.fromLTRB(120, 70, 0, 0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              selected = index;
                                            });
                                            showAlertDialog1(
                                                context, iprs[index]);
                                          },
                                          child: Text(
                                            "BID",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.lightBlue,
                                              minimumSize: Size(15, 25)),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextEditingController price = TextEditingController();
showAlertDialog1(BuildContext context, var ipr) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text("Bid"),
    onPressed: () {
      if (double.parse(price.text) > (double.parse(ipr["highestbid"] ?? "0"))) {
        FirebaseFirestore.instance
            .doc("users/${ipr["uid"]}/forms/${ipr["id"]}")
            .set({
          "highestbid": price.text,
          "highestbidder": FirebaseAuth.instance.currentUser.uid
        }, SetOptions(merge: true)).then((value) {
          Navigator.pop(context);
        });
      } else {
        Fluttertoast.showToast(msg: "Enter Higher Bid!!!");
      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("What price you want to bid for Patent?"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: price,
          validator: (value) {
            if (value.isEmpty) {
              return ("Feild can't be empty");
            }
            return null;
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            labelText: 'Price(In INR)',
          ),
        ),
      ],
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension StringExtension on String {
  // Method used for capitalizing the input from the form
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
