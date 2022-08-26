import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipr/patent_forms/ongoing_form.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SubmittedApplication extends StatefulWidget {
  const SubmittedApplication({Key key}) : super(key: key);

  @override
  State<SubmittedApplication> createState() => _SubmittedApplicationState();
}

class _SubmittedApplicationState extends State<SubmittedApplication> {
  List applications = [];
  Future<void> getapplications() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    QuerySnapshot qsnap =
        await FirebaseFirestore.instance.collection("users/$uid/forms").get();
    for (var element in qsnap.docs) {
      Map<String, dynamic> data = element.data();
      data.addAll({'id': element.id});
      setState(() {
        applications.add(data);
      });
    }
  }

  @override
  void initState() {
    getapplications();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: applications.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  OngoingForms(applications[index]["id"]),
                            ),
                          );
                        },
                        child: Card(
                            child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                " Id:\n ${applications[index]["id"]}"),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                  " Started:\n ${timeago.format(DateTime.parse(applications[index]["timeapplied"]))}"),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                  " Updated:\n ${timeago.format(DateTime.parse(applications[index]["timewhenlastchanged"]))}"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: 150,
                                                child: Text(
                                                  " Update:\n ${applications[index]["update"]}",
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: 150,
                                                child: Text(
                                                  " Status:\n ${applications[index]["status"]}",
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      (applications[index]["issold"] ?? false)
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: 150,
                                                child: Text(
                                                  " Expiry Date:\n ${applications[index]["sellingdate"]}",
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          applications[index]["status"] ==
                                                      "granted" &&
                                                  ((applications[index]
                                                          ["price"] ==
                                                      null))
                                              ? Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: FlatButton(
                                                      child: Text(
                                                        ((applications[index][
                                                                        "sell"] ??
                                                                    0) ==
                                                                0)
                                                            ? 'Bid'
                                                            : ((applications[index]
                                                                            [
                                                                            "sell"] ??
                                                                        0) ==
                                                                    3)
                                                                ? 'Bidding'
                                                                : 'Sold',
                                                        style: TextStyle(
                                                            fontSize: 20.0),
                                                      ),
                                                      color: ((applications[
                                                                          index]
                                                                      [
                                                                      "sell"] ??
                                                                  0) ==
                                                              0)
                                                          ? Colors.red
                                                          : ((applications[index]
                                                                          [
                                                                          "sell"] ??
                                                                      0) ==
                                                                  3)
                                                              ? Colors.yellow
                                                              : Colors.green,
                                                      textColor: Colors.white,
                                                      onPressed: () {
                                                        showAlertDialog1(
                                                            context, index);
                                                      },
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          (applications[index]["status"] ==
                                                      "granted" &&
                                                  !((applications[index]
                                                          ["bid"] ??
                                                      false)))
                                              ? Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: FlatButton(
                                                      child: Text(
                                                        ((applications[index][
                                                                        "sell"] ??
                                                                    0) ==
                                                                0)
                                                            ? 'Sell'
                                                            : ((applications[index]
                                                                            [
                                                                            "sell"] ??
                                                                        0) ==
                                                                    1)
                                                                ? 'Selling'
                                                                : 'Sold',
                                                        style: TextStyle(
                                                            fontSize: 20.0),
                                                      ),
                                                      color: ((applications[
                                                                          index]
                                                                      [
                                                                      "sell"] ??
                                                                  0) ==
                                                              0)
                                                          ? Colors.red
                                                          : ((applications[index]
                                                                          [
                                                                          "sell"] ??
                                                                      0) ==
                                                                  1)
                                                              ? Colors.yellow
                                                              : Colors.green,
                                                      textColor: Colors.white,
                                                      onPressed: () {
                                                        showAlertDialog(
                                                            context, index);
                                                      },
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ]))),
                      ));
                }),
          ],
        ),
      ),
    );
  }

  TextEditingController price = TextEditingController();
  TextEditingController filing_date2_2 = TextEditingController();

  TextEditingController filing_date2_1 = TextEditingController();
  showAlertDialog(BuildContext context, int index) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Sell"),
      onPressed: () {
        FirebaseFirestore.instance
            .doc(
                "users/${applications[index]["uid"]}/forms/${applications[index]["id"]}")
            .set({
          "sell": 1,
          "price": price.text,
          "sellingdate": filing_date2_2.text,
        }, SetOptions(merge: true)).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => SubmittedApplication(),
            ),
          );
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("What should be price of your patent?"),
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
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: filing_date2_2,
            validator: (value) {
              if (value.isEmpty) {
                return ("Feild can't be empty");
              }
              return null;
            },
            onTap: () async {
              DateTime pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1974),
                  lastDate: DateTime(2101));

              if (pickeddate != null) {
                setState(() {
                  filing_date2_2.text =
                      DateFormat('dd-MM-yyyy').format(pickeddate);
                });
              }
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              labelText: 'International filing date (dd/mm/yyyy)',
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

  showAlertDialog1(BuildContext context, int index) {
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
        FirebaseFirestore.instance
            .doc(
                "users/${applications[index]["uid"]}/forms/${applications[index]["id"]}")
            .set({
          "sell": 3,
          "bid": true,
          "biddingdate": filing_date2_1.text,
          "sellingdate": filing_date2_2.text,
        }, SetOptions(merge: true)).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => SubmittedApplication(),
            ),
          );
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("What should be Bidding date of your Patent?"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: filing_date2_1,
            validator: (value) {
              if (value.isEmpty) {
                return ("Feild can't be empty");
              }
              return null;
            },
            onTap: () async {
              DateTime pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1974),
                  lastDate: DateTime(2101));

              if (pickeddate != null) {
                setState(() {
                  filing_date2_1.text =
                      DateFormat('dd-MM-yyyy').format(pickeddate);
                });
              }
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              labelText: 'Bidding date (dd/mm/yyyy)',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: filing_date2_2,
            validator: (value) {
              if (value.isEmpty) {
                return ("Feild can't be empty");
              }
              return null;
            },
            onTap: () async {
              DateTime pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1974),
                  lastDate: DateTime(2101));

              if (pickeddate != null) {
                setState(() {
                  filing_date2_2.text =
                      DateFormat('dd-MM-yyyy').format(pickeddate);
                });
              }
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              labelText: 'Selling Date date (dd/mm/yyyy)',
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
}
