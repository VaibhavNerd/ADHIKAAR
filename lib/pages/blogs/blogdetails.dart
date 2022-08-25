import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class Blogdetails extends StatefulWidget {
  Blogdetails(this.blog);
  dynamic blog;

  @override
  State<Blogdetails> createState() => _BlogdetailsState();
}

class _BlogdetailsState extends State<Blogdetails> {
  TextEditingController comment = TextEditingController();
  Map<String, dynamic> blog = {};
  Future<void> setblog() async {
    blog = await FirebaseFirestore.instance
        .doc("/AppData/Blogs/Blogdata/" + widget.blog["id"])
        .get()
        .then((value) {
      return value.data();
    });
    int lengthlikes = await FirebaseFirestore.instance
        .collection('/AppData/Blogs/Blogdata/${widget.blog["id"]}/likes')
        .get()
        .then((value) => value.size);
    int lengthcomments = await FirebaseFirestore.instance
        .collection('/AppData/Blogs/Blogdata/${widget.blog["id"]}/comments')
        .get()
        .then((value) => value.size);
    int lengthsaved = await FirebaseFirestore.instance
        .collection('/AppData/Blogs/Blogdata/${widget.blog["id"]}/saved')
        .get()
        .then((value) => value.size);
    print("got here");
    setState(() {
      blog.addEntries({
        "id": widget.blog["id"],
        "comments": lengthcomments.toString(),
        "saves": lengthsaved.toString(),
        "likes": lengthlikes.toString()
      }.entries);
    });
    print(blog);
  }

  List comments = [];
  Future<void> getcomments() async {
    comments = [];
    CollectionReference _collectionRef = FirebaseFirestore.instance
        .collection('/AppData/Blogs/Blogdata/${widget.blog["id"]}/comments');
    QuerySnapshot querySnapshot = await _collectionRef.get();

    for (var item in querySnapshot.docs) {
      try {
        Map<String, dynamic> document = (item.data() as Map<String, dynamic>);

        comments.add(document);
        print(document);
      } on Exception catch (e) {
        print(e);
      }
    }
  }

  bool islikedbyme = false;
  bool issavedbyme = false;
  Future<void> getdata() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentReference usersRef = FirebaseFirestore.instance
        .collection("/AppData/Blogs/Blogdata/${widget.blog["id"]}/likes")
        .doc(uid);

    usersRef.get().then((docSnapshot) => {
          if (docSnapshot.exists)
            {islikedbyme = true}
          else
            {islikedbyme = false}
        });

    setState(() {
      print(islikedbyme);
      islikedbyme;
    });
    DocumentReference usersaved = FirebaseFirestore.instance
        .collection("/AppData/Blogs/Blogdata/${widget.blog["id"]}/saved")
        .doc(uid);

    usersaved.get().then((docSnapshot) => {
          if (docSnapshot.exists)
            {issavedbyme = true}
          else
            {issavedbyme = false}
        });
    setState(() {
      print(issavedbyme);
      issavedbyme;
    });
  }

  @override
  void initState() {
    blog = widget.blog;
    getdata();
    setblog();
    getcomments();
    // TODO: implement initState
    super.initState();
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
                        SizedBox(
                          height: 100,
                        ),
                        part1(context),
                        SizedBox(
                          height: 20,
                        ),
                        part2(),
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
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          part1(context),
                          SizedBox(
                            height: 20,
                          ),
                          part2(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  SizedBox part2() {
    return SizedBox(
      width: 1000,
      //  height: 500,
      child: SingleChildScrollView(
          child: Text(
        blog["blog"],
        style: TextStyle(color: whitecolor, fontSize: 15),
      )),
    );
  }

  SizedBox part1(BuildContext context) {
    return SizedBox(
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.blog["topic"],
              style: TextStyle(color: whitecolor, fontWeight: FontWeight.bold)),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  String uid = FirebaseAuth.instance.currentUser.uid;
                  // await FirebaseFirestore.instance
                  //     .doc(
                  //         "/AppData/Blogs/Blogdata/${widget.blog["id"]}/likes/$uid")
                  //     .delete();

                  print(FirebaseFirestore.instance
                      .doc(
                          "/AppData/Blogs/Blogdata/${widget.blog["id"]}/likes/$uid")
                      .id);
                  !islikedbyme
                      ? await FirebaseFirestore.instance
                          .doc(
                              "/AppData/Blogs/Blogdata/${widget.blog["id"]}/likes/$uid")
                          .set({"uid": uid})
                      : await FirebaseFirestore.instance
                          .doc(
                              "/AppData/Blogs/Blogdata/${widget.blog["id"]}/likes/$uid")
                          .delete();
                  setblog();
                  getdata();
                  // savedblogsfunc();
                },
                child: Column(
                  children: [
                    Image.asset(
                      islikedbyme
                          ? "assets/filled heart (2)@2x.png"
                          : "assets/heart (2)@2x.png",
                      width: 20,
                      height: 20,
                    ),
                    Text(
                      blog["likes"].toString(),
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (ct) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                    color: bcolor,
                                    height: 35,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35, right: 35),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Comments",
                                            style: TextStyle(
                                                color: whitecolor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(ct);
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: whitecolor,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                TextFormField(
                                  controller: comment,
                                  decoration: InputDecoration(
                                      hintText: "Add Your Comments",
                                      suffixIcon: InkWell(
                                          onTap: () async {
                                            String uid = FirebaseAuth
                                                .instance.currentUser.uid;
                                            await FirebaseFirestore.instance
                                                .collection(
                                                    "/AppData/Blogs/Blogdata/${widget.blog["id"]}/comments/")
                                                .add({
                                              "comment": comment.text,
                                              "name": "",
                                              "photo": "none"
                                            }).then((value) {
                                              getcomments();
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Icon(Icons.send))),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: comments.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        leading: Icon(Icons.person),
                                        // trailing: Icon(
                                        //   Icons.delete,
                                        //   color: Colors.red,
                                        // ),
                                        // title:
                                        //     Text(comments[index]["name"] ?? ""),
                                        // sub
                                        title: Text(comments[index]["comment"]),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Column(
                  children: [
                    Image.asset(
                      "assets/chat (3)@2x.png",
                      width: 20,
                      height: 20,
                    ),
                    Text(
                      blog["comments"],
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      String uid = FirebaseAuth.instance.currentUser.uid;
                      print("*****");
                      print(issavedbyme);
                      !issavedbyme
                          ? await FirebaseFirestore.instance
                              .collection(
                                  "/AppData/Blogs/Blogdata/${widget.blog["id"]}/saved/")
                              .doc(uid)
                              .set({"uid": uid})
                          : await FirebaseFirestore.instance
                              .collection(
                                  "/AppData/Blogs/Blogdata/${widget.blog["id"]}/saved/")
                              .doc(uid)
                              .delete();

                      setblog();
                      getdata();
                    },
                    child: Image.asset(
                      !issavedbyme
                          ? "assets/sa@2x.png"
                          : "assets/filled@2x.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Text(
                    blog["saves"],
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
