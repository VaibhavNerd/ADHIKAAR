import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ipr/strings/patent_form2.dart';

import '../services/firebase_services.dart';
import 'ongoing_form.dart';

class PatentForm18 extends StatefulWidget {
  PatentForm18(this.applicationid);
  String applicationid;
  @override
  State<PatentForm18> createState() => _PatentForm18State();
}

class _PatentForm18State extends State<PatentForm18> {
  int _activeStepIndex = 0;
  List applicant = [];
  TextEditingController title2 = TextEditingController();
  TextEditingController name2 = TextEditingController();
  TextEditingController nationality2 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController povisional2 = TextEditingController();
  TextEditingController complete2 = TextEditingController();
  String url = "";
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> data = {};
  Map<String, dynamic> data1 = {};
  getipr() async {
    data1 = (await getformdatafromid(widget.applicationid));
    data = data1['form18'] ?? {};
    setState(() {
      data;
      data1;
    });
    print(data);
    setState(() {
      title2.text = data['title2'];
      applicant = data['applicant'] ?? [];
      povisional2.text = data['provisional2'];
      complete2.text = data['complete2'];
      url = data['url2'];
    });
  }

  @override
  void initState() {
    getipr();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    " Invention",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: title2,
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
                    labelText: 'Title Of The Invention',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: applicant.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "Name: ${applicant[index]["name"]}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "Nationality: ${applicant[index]["nationality"]}"),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "Address: ${applicant[index]["address"]}"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]);
                    }),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    " Applicant(s)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: name2,
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
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: nationality2,
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
                    labelText: 'Nationality',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: address2,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    labelText: 'Address',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      applicant.add({
                        'name': name2.text,
                        'nationality': nationality2.text,
                        'address': address2.text
                      });
                    });
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      //color: Colors.green,
                      width: 80,

                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.add_circle_rounded,
                              color: Colors.blueAccent,
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Add new',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    " Preamble To The Description",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: povisional2,
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
                    labelText: 'Provisional',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: complete2,
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
                      labelText: 'Complete'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    " To be submitted in documnet form",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "1.Description",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "(Description shall start from next page.)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "2.Claims",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    """(not applicable for provisional specification. Claims should start with the preamble —"1/we claim" on separate page)""",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "3.Date And Signature",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    " (Description shall start from next page.)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "4.Abstract Of The Invention",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "(to be given at the end of last page of specification)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Upload Your Documents Here",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                    "${url == "" ? "No File Uploaded" : "File Uploaded Successfully"}"),
                Row(children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed: () async {
                        url = await getAndUpload();
                        setState(() {
                          url;
                        });
                      },
                      child: Text(
                        "Upload",
                        style: TextStyle(fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          minimumSize: Size(20, 30)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(children: <Widget>[
                    Container(
                        width: 52,
                        child: Column(children: <Widget>[
                          Text(
                            'notes',
                            style: TextStyle(fontSize: 18),
                          ),
                        ])),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: AlertDialog(
                                  title: Text(
                                    "Declaration by the applicant(s) in the convention country",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"))
                                  ],
                                  content: Container(
                                    child: SingleChildScrollView(
                                      child: Text(note),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: Colors.blueAccent,
                        size: 18,
                      ),
                    ),
                  ]),
                ]),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate() && url != "") {
                        Map<String, dynamic> data = {
                          'title2': title2.text,
                          'applicant': applicant,
                          'provisional2': povisional2.text,
                          'complete2': complete2.text,
                          'url2': url,
                        };

                        String uid = FirebaseAuth.instance.currentUser.uid;
                        FirebaseFirestore.instance
                            .doc("users/$uid/forms/${widget.applicationid}")
                            .set({"form18": data},
                                SetOptions(merge: true)).then((value) {
                          List formdone = ((data1["formsdone"] ?? []));
                          formdone.add(18);
                          print((data1["formsdone"] ?? []));
                          FirebaseFirestore.instance
                              .doc("users/$uid/forms/${widget.applicationid}")
                              .set({
                            "formsdone": formdone,
                            'timewhenlastchanged': DateTime.now().toString(),
                            'update': "Form 18 Completed"
                          }, SetOptions(merge: true)).then((value) {
                            Fluttertoast.showToast(
                                msg:
                                    "Your application submitted successfully!!!",
                                fontSize: 16.0);
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    OngoingForms(widget.applicationid),
                              ),
                            );
                          });
                        });
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent, minimumSize: Size(20, 30)),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> getAndUpload() async {
    var rng = new Random();
    String randomName = "";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }
    FilePickerResult result = await FilePicker.platform.pickFiles();
    File file = await File(result.files.single.path);
    String fileName = '${randomName}';
    print(fileName);
    print('${file.readAsBytesSync()}');
    return await savePdf(file, fileName);
  }

  Future<String> savePdf(File asset, String name) async {
    final storageRef = FirebaseStorage.instance.ref();

// Create a reference to "mountains.jpg"
    final mountainsRef = storageRef.child(name);
    try {
      String url = await mountainsRef.putFile(asset).then((p0) async {
        print("I am Here");
        String urlofassesment =
            await mountainsRef.getDownloadURL().then((value) {
          print(value);
          return value;
        });
        return urlofassesment;
      });
      return url;
    } on FirebaseException catch (e) {
      print("exception found");
      print(e);

      // ...
    }
    //  return "";
  }
}
