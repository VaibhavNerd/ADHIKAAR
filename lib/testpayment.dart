
// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:ipr/pages/themeHelper.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// class MyHomePage extends StatefulWidget {
//   const MyHomePage();
// String val
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//     Map<String, dynamic> ipr = {};
//   bool paymentstatus = false;
//   getipr() async {
//     ipr = await getformdatafromid(widget.applicationid);
//     print(widget.applicationid);
//     setState(() {
//       if ((ipr['formsdone'] as List).contains(1) &&
//           (ipr['formsdone'] as List).contains(2) &&
//           (ipr['formsdone'] as List).contains(3) &&
//           (ipr['formsdone'] as List).contains(5) &&
//           (ipr['formsdone'] as List).contains(18) &&
//           (ipr['formsdone'] as List).contains(26)) {
//         print("yesss");
//       } else {
//         print("noooooooo");
//       }
//       ipr;
//     });
//   }

//   @override
 

//   bool isSwitched = false;
//   var textValue = 'Switch is OFF';

//   void toggleSwitch(bool value) {
//     if (isSwitched == false) {
//       setState(() {
//         isSwitched = true;
//         textValue = 'Switch Button is ON';
//       });
//       print('Switch Button is ON');
//     } else {
//       setState(() {
//         isSwitched = false;
//         textValue = 'Switch Button is OFF';
//       });
//       print('Switch Button is OFF');
//     }
//   }

//    Razorpay _razorpay;
//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   void openCheckout() async {
//     var options = {
//       'key': "rzp_test_o1QrJ7wZrJv947",
//       'amount': 399 * 100,
//       'name': 'OWASP RGIPT Student Schapter',
//       'description': 'Registration fee',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       // 'prefill': {'contact': phone, 'email': email},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: e');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//     log('Success Response: $response');
//     Fluttertoast.showToast(
//         msg: "SUCCESS: " + response.paymentId,
//         toastLength: Toast.LENGTH_SHORT);

//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     log('Error Response: $response');
//     /* Fluttertoast.showToast(
//         msg: "ERROR: " + response.code.toString() + " - " + response.message!,
//         toastLength: Toast.LENGTH_SHORT); */
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     log('External SDK Response: $response');
//     /* Fluttertoast.showToast(
//         msg: "EXTERNAL_WALLET: " + response.walletName!,
//         toastLength: Toast.LENGTH_SHORT); */
//   }


//   @override
//   void initState() {
//      getipr();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(height: 50),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Card(
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child:
//                               Text("Application Id:\n ${widget.applicationid}"),
//                         ),
//                         Column(
//                           children: [
//                             Text("${isSwitched ? "Complete" : "Provisional"}"),
//                             Switch(
//                               onChanged: toggleSwitch,
//                               value: isSwitched,
//                               activeColor: Colors.blue,
//                               activeTrackColor: Colors.blue,
//                               inactiveThumbColor: Colors.grey,
//                               inactiveTrackColor: Colors.grey,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                               "Application Started:\n ${ipr["timeapplied"].toString().substring(0, 16)}"),
//                           Text(
//                               "Application Updated:\n ${ipr["timewhenlastchanged"].toString().substring(0, 16)}"),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                               "Application Status:\n ${ipr["status"].toString()}"),
//                           Text(
//                               "Application Status:\n ${ipr["update"].toString()}"),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) =>
//                       PatentForm1(widget.applicationid),
//                 ),
//               );
//             },
//             child: Card(
//               elevation: 8.0,
//               margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//               child: Container(
//                 decoration:
//                     BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
//                 child: ListTile(
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                     title: Text(
//                       "Form 1",
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                     // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

//                     subtitle: !((ipr["formsdone"] ?? []) as List).contains(1)
//                         ? Text(" Please fill this form to unlock others",
//                             style: TextStyle(color: Colors.white))
//                         : null,
//                     trailing: Icon(Icons.keyboard_arrow_right,
//                         color: Colors.white, size: 30.0)),
//               ),
//             ),
//           ),
//           ((ipr["formsdone"] ?? []) as List).contains(1)
//               ? Column(
//                   children: [
//                     isSwitched
//                         ? InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute<void>(
//                                   builder: (BuildContext context) =>
//                                       PatentForm2(widget.applicationid),
//                                 ),
//                               );
//                             },
//                             child: Card(
//                               elevation: 8.0,
//                               margin: new EdgeInsets.symmetric(
//                                   horizontal: 10.0, vertical: 6.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Color.fromRGBO(64, 75, 96, .9)),
//                                 child: ListTile(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 20.0, vertical: 10.0),
//                                     title: Text(
//                                       "Form 2",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

//                                     // subtitle: Text(" Please fill this form to unlock others",
//                                     //     style: TextStyle(color: Colors.white)),
//                                     trailing: Icon(Icons.keyboard_arrow_right,
//                                         color: Colors.white, size: 30.0)),
//                               ),
//                             ),
//                           )
//                         : Container(),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute<void>(
//                             builder: (BuildContext context) =>
//                                 PatentForm2(widget.applicationid),
//                           ),
//                         );
//                       },
//                       child: Card(
//                         elevation: 8.0,
//                         margin: new EdgeInsets.symmetric(
//                             horizontal: 10.0, vertical: 6.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(64, 75, 96, .9)),
//                           child: ListTile(
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 20.0, vertical: 10.0),
//                               title: Text(
//                                 "Form 3",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

//                               // subtitle: Text(" Please fill this form to unlock others",
//                               //     style: TextStyle(color: Colors.white)),
//                               trailing: Icon(Icons.keyboard_arrow_right,
//                                   color: Colors.white, size: 30.0)),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute<void>(
//                             builder: (BuildContext context) =>
//                                 PatentForm2(widget.applicationid),
//                           ),
//                         );
//                       },
//                       child: Card(
//                         elevation: 8.0,
//                         margin: new EdgeInsets.symmetric(
//                             horizontal: 10.0, vertical: 6.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(64, 75, 96, .9)),
//                           child: ListTile(
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 20.0, vertical: 10.0),
//                               title: Text(
//                                 "Form 5",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

//                               // subtitle: Text(" Please fill this form to unlock others",
//                               //     style: TextStyle(color: Colors.white)),
//                               trailing: Icon(Icons.keyboard_arrow_right,
//                                   color: Colors.white, size: 30.0)),
//                         ),
//                       ),
//                     ),
//                     isSwitched
//                         ? InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute<void>(
//                                   builder: (BuildContext context) =>
//                                       PatentForm2(widget.applicationid),
//                                 ),
//                               );
//                             },
//                             child: Card(
//                               elevation: 8.0,
//                               margin: new EdgeInsets.symmetric(
//                                   horizontal: 10.0, vertical: 6.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Color.fromRGBO(64, 75, 96, .9)),
//                                 child: ListTile(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 20.0, vertical: 10.0),
//                                     title: Text(
//                                       "Form 18",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

//                                     // subtitle: Text(" Please fill this form to unlock others",
//                                     //     style: TextStyle(color: Colors.white)),
//                                     trailing: Icon(Icons.keyboard_arrow_right,
//                                         color: Colors.white, size: 30.0)),
//                               ),
//                             ),
//                           )
//                         : Container(),
//                     isSwitched
//                         ? InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute<void>(
//                                   builder: (BuildContext context) =>
//                                       PatentForm2(widget.applicationid),
//                                 ),
//                               );
//                             },
//                             child: Card(
//                               elevation: 8.0,
//                               margin: new EdgeInsets.symmetric(
//                                   horizontal: 10.0, vertical: 6.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Color.fromRGBO(64, 75, 96, .9)),
//                                 child: ListTile(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 20.0, vertical: 10.0),
//                                     title: Text(
//                                       "Form 25",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

//                                     // subtitle: Text(" Please fill this form to unlock others",
//                                     //     style: TextStyle(color: Colors.white)),
//                                     trailing: Icon(Icons.keyboard_arrow_right,
//                                         color: Colors.white, size: 30.0)),
//                               ),
//                             ),
//                           )
//                         : Container(),
//                   ],
//                 )
//               : Container(),
//           paymentstatus
//               ? Container(
//                   height: 30,
//                   width: 130,
//                   decoration: ThemeHelper().buttonBoxDecoration(context),
//                   child: ElevatedButton(
//                       style: ThemeHelper().buttonStyle(),
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 7, 10, 10),
//                         child: Text(
//                           "Search".toUpperCase(),
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       onPressed: () {
//                         //count1++;
                       
//                       }),
//                 )
//               : Container()
//         ],
//       ),
//     );
//   }

// }
