import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipr/patent_forms/ongoing_form.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SHowIPR extends StatefulWidget {
  SHowIPR(this.data);
  Map<String, dynamic> data;
  @override
  State<SHowIPR> createState() => _SHowIPRState();
}

class _SHowIPRState extends State<SHowIPR> {
  List applications = [];
  Future<void> getapplications() async {
    applications.add(widget.data);
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
                                      applications[index]["status"] == "granted"
                                          ? Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                margin: EdgeInsets.all(5),
                                                child: FlatButton(
                                                  child: Text(
                                                    ((applications[index]
                                                                    ["sell"] ??
                                                                0) ==
                                                            0)
                                                        ? 'Sell'
                                                        : ((applications[index][
                                                                        "sell"] ??
                                                                    0) ==
                                                                1)
                                                            ? 'Selling'
                                                            : 'Sold',
                                                    style: TextStyle(
                                                        fontSize: 20.0),
                                                  ),
                                                  color: ((applications[index]
                                                                  ["sell"] ??
                                                              0) ==
                                                          0)
                                                      ? Colors.red
                                                      : ((applications[index][
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
                                    ]))),
                      ));
                }),
          ],
        ),
      ),
    );
  }

  TextEditingController price = TextEditingController();

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
            .set({"sell": 1, "price": price.text},
                SetOptions(merge: true)).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => SHowIPR(widget.data),
            ),
          );
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("What should be price of your patent?"),
      content: TextFormField(
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
