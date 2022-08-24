import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                      child: Card(
                          child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              " Id:\n ${applications[index]["id"]}"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            " Status:\n ${applications[index]["status"]}",
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              " Started:\n ${timeago.format(DateTime.parse(applications[index]["timeapplied"]))}"),
                                          Text(
                                              " Updated:\n ${timeago.format(DateTime.parse(applications[index]["timewhenlastchanged"]))}"),
                                        ],
                                      ),
                                    )
                                  ]))));
                }),
          ],
        ),
      ),
    );
  }
}
