import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipr/pages/blogs/blogs.dart';

import '../../constant.dart';

class UploadBlog extends StatefulWidget {
  const UploadBlog({Key key}) : super(key: key);

  @override
  State<UploadBlog> createState() => _UploadBlogState();
}

class _UploadBlogState extends State<UploadBlog> {
  TextEditingController topic = TextEditingController();
  TextEditingController body = TextEditingController();
  Future<void> uploadblog() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference users =
        FirebaseFirestore.instance.collection("/AppData/Blogs/Blogdata");
    return users.add({
      'uid': uid,
      'topic': topic.text,
      'blog': body.text,
      'likes': 0,
      'saves': 0,
      'createdat': DateTime.now().toString()
    }).then((value) {
      print("Blog Uploaded");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => Blogs(),
        ),
      );
    }).catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    bool isweb = MediaQuery.of(context).size.width > 700;
    return Scaffold(
      backgroundColor: bcolor,
      body: isweb
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        part1(),
                        part2(),
                        SizedBox(
                          height: 40,
                        ),
                        part3(),
                        SizedBox(
                          height: 40,
                        ),
                        part4(),
                      ],
                    ),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          part1(),
                          part2(),
                          SizedBox(
                            height: 40,
                          ),
                          part3(),
                          SizedBox(
                            height: 40,
                          ),
                          part4(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  SizedBox part4() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(),
          InkWell(
            onTap: () {
              uploadblog();
            },
            child: Card(
              color: greencolor,
              child: SizedBox(
                width: 120,
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(children: [
                    Text(
                      "  Upload Blog  ",
                      style: TextStyle(),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox part3() {
    bool isweb = MediaQuery.of(context).size.width > 700;
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      child: Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 200,
              child: Card(
                child: TextFormField(
                    controller: body,
                    maxLength: 5000,
                    decoration: InputDecoration(
                        hintText:
                            "      Enter the your blog Content   (Max 5000 words)",
                        border: InputBorder.none)),
              )),
        ],
      ),
    );
  }

  SizedBox part2() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      child: Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 50,
              child: Card(
                child: TextFormField(
                    controller: topic,
                    decoration: InputDecoration(
                        hintText: "      Enter The Topic",
                        border: InputBorder.none)),
              )),
        ],
      ),
    );
  }

  SizedBox part1() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Upload Blog",
              style: TextStyle(color: whitecolor, fontWeight: FontWeight.bold)),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Blogs(),
                    ),
                  );
                },
                child: Image.asset(
                  "assets/sa@2x.png",
                  width: 20,
                  height: 20,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Blogs(),
                    ),
                  );
                },
                child: Card(
                  color: whitecolor,
                  child: SizedBox(
                    width: 80,
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(children: [
                        Text(
                          "  My Blog  ",
                          style: TextStyle(color: Colors.black),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Card(
                color: greencolor,
                child: SizedBox(
                  width: 120,
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(children: [
                      Text(
                        "  Upload Blog  ",
                        style: TextStyle(),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
