import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipr/pages/blogs/blogdetails.dart';
import 'package:ipr/pages/blogs/uploadblog.dart';

import '../../constant.dart';

class Blogs extends StatefulWidget {
  Blogs();
  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  bool isloading = true;
  List allblogdata = [];
  List myblogdata = [];
  Future<void> loadblogs() async {
    allblogdata = [];
    myblogdata = [];
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('/AppData/Blogs/Blogdata');
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List

    for (var item in querySnapshot.docs) {
      try {
        print(item.id);
        int lengthlikes = await FirebaseFirestore.instance
            .collection('/AppData/Blogs/Blogdata/${item.id}/likes')
            .get()
            .then((value) => value.size);
        int lengthcomments = await FirebaseFirestore.instance
            .collection('/AppData/Blogs/Blogdata/${item.id}/comments')
            .get()
            .then((value) => value.size);
        int lengthsaved = await FirebaseFirestore.instance
            .collection('/AppData/Blogs/Blogdata/${item.id}/saved')
            .get()
            .then((value) => value.size);

        Map<String, dynamic> document = (item.data() as Map<String, dynamic>);

        setState(() {
          document.addEntries({
            "id": item.id,
            "comments": lengthcomments.toString(),
            "saves": lengthsaved.toString(),
            "likes": lengthlikes.toString()
          }.entries);
          allblogdata.add(document);
          if (document["uid"] == FirebaseAuth.instance.currentUser.uid) {
            myblogdata.add(document);
          }
          isloading = false;
        });
      } on Exception catch (e) {
        print(e);
      }
    }

    // setState(() {
    //   isloading = false;
    // });

    // for (var item in querySnapshot.docs) {
    //   int lengthlikes = await FirebaseFirestore.instance
    //       .collection('/AppData/Blogs/Blogdata/${item.id}/likes')
    //       .get()
    //       .then((value) => value.size);
    //   int lengthcomments = await FirebaseFirestore.instance
    //       .collection('/AppData/Blogs/Blogdata/${item.id}/comments')
    //       .get()
    //       .then((value) => value.size);
    //   int lengthsaved = await FirebaseFirestore.instance
    //       .collection('/AppData/Blogs/Blogdata/${item.id}/saved')
    //       .get()
    //       .then((value) => value.size);
    //   Map<String, dynamic> document = (item.data() as Map<String, dynamic>);
    //   document.addEntries({
    //     "id": item.id,
    //     "comments": lengthcomments.toString(),
    //     "saves": lengthsaved.toString(),
    //     "likes": lengthlikes.toString()
    //   }.entries);
    //   setState(() {

    //   });
    // }

    setState(() {});
    print(allblogdata);
  }

  List savedblogs = [];
  Future<void> savedblogsfunc() async {
    savedblogs = [];
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('/AppData/Blogs/Blogdata');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    querySnapshot.docs.forEach((element) async {
      String uid = FirebaseAuth.instance.currentUser.uid;
      try {
        DocumentSnapshot docsnap = await FirebaseFirestore.instance
            .doc('/AppData/Blogs/Blogdata/${element.id}/saved/$uid')
            .get();
        if (docsnap.exists) {
          int lengthlikes = await FirebaseFirestore.instance
              .collection('/AppData/Blogs/Blogdata/${element.id}/likes')
              .get()
              .then((value) => value.size);
          int lengthcomments = await FirebaseFirestore.instance
              .collection('/AppData/Blogs/Blogdata/${element.id}/comments')
              .get()
              .then((value) => value.size);
          int lengthsaved = await FirebaseFirestore.instance
              .collection('/AppData/Blogs/Blogdata/${element.id}/saved')
              .get()
              .then((value) => value.size);
          print("got here");
          Map<String, dynamic> document =
              (element.data() as Map<String, dynamic>);
          document.addEntries({
            "id": element.id,
            "comments": lengthcomments.toString(),
            "saves": lengthsaved.toString(),
            "lengthlikes": lengthlikes.toString()
          }.entries);
          setState(() {
            savedblogs.add(document);
          });
        }
      } on Exception catch (e) {}
    });

    // Get data from docs and convert map to List

    // setState(() {
    //   isloading = false;
    // });
  }

  bool issaved = false;
  bool ismyblog = false;

  @override
  void initState() {
    loadblogs();
    savedblogsfunc();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isweb = MediaQuery.of(context).size.width > 700;
    return Scaffold(
      backgroundColor: bcolor,
      body: isloading
          ? Center(
              child: SizedBox(
              child: CircularProgressIndicator(),
              height: 30,
              width: 30,
            ))
          : isweb
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
                            part1(context),
                            issaved
                                ? part2()
                                : ismyblog
                                    ? part3()
                                    : part4(context),
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
                          height: 70,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              part1(context),
                              issaved
                                  ? part2()
                                  : ismyblog
                                      ? part3()
                                      : part4(context),
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

  SizedBox part4(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: 500,
      child: SingleChildScrollView(
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                mainAxisExtent: 100,
                childAspectRatio: 7,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30),
            itemCount: allblogdata.length,
            itemBuilder: (BuildContext ctx, index) {
              return SizedBox(
                width: 100,
                height: 100,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            Blogdetails(allblogdata[index]),
                      ),
                    );
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  allblogdata[index]["topic"],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () async {
                                    String uid =
                                        FirebaseAuth.instance.currentUser.uid;
                                    savedblogs
                                            .where((element) =>
                                                element["id"] ==
                                                allblogdata[index]["id"])
                                            .toList()
                                            .isEmpty
                                        ? await FirebaseFirestore.instance
                                            .collection(
                                                "/AppData/Blogs/Blogdata/${allblogdata[index]["id"]}/saved/")
                                            .doc(uid)
                                            .set({"uid": uid})
                                        : await FirebaseFirestore.instance
                                            .collection(
                                                "/AppData/Blogs/Blogdata/${allblogdata[index]["id"]}/saved/")
                                            .doc(uid)
                                            .delete();

                                    savedblogsfunc();
                                  },
                                  child: Image.asset(
                                    savedblogs
                                            .where((element) =>
                                                element["id"] ==
                                                allblogdata[index]["id"])
                                            .toList()
                                            .isEmpty
                                        ? "assets/sa@2x.png"
                                        : "assets/filled@2x.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                            Text(allblogdata[index]["blog"],
                                softWrap: true,
                                style: TextStyle(color: greycolor),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis)
                          ],
                        ),
                      )),
                ),
              );
            }),
      ),
    );
  }

  SizedBox part3() {
    return SizedBox(
      width: 1000,
      height: 500,
      child: SingleChildScrollView(
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                mainAxisExtent: 120,
                childAspectRatio: 7,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30),
            itemCount: myblogdata.length,
            itemBuilder: (BuildContext ctx, index) {
              return SizedBox(
                width: 100,
                height: 100,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                myblogdata[index]["topic"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assets/heart (2)@2x.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Text(
                                          myblogdata[index]["likes"].toString())
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assets/chat (3)@2x.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Text(myblogdata[index]["comments"]
                                          .toString())
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assets/sa@2x.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Text(
                                          myblogdata[index]["saves"].toString())
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 50,
                                    child: Column(
                                      children: [
                                        // CircleAvatar(
                                        //   backgroundColor: greencolor,
                                        //   radius: 10,
                                        //   child: Icon(
                                        //     Icons.edit,
                                        //     size: 10,
                                        //     color: whitecolor,
                                        //   ),
                                        // ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await FirebaseFirestore.instance
                                                .doc(
                                                    '/AppData/Blogs/Blogdata/${myblogdata[index]["id"]}/')
                                                .delete()
                                                .then((value) =>
                                                    {Navigator.pop(context)});
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: greencolor,
                                            radius: 10,
                                            child: Icon(
                                              Icons.delete,
                                              size: 10,
                                              color: whitecolor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(myblogdata[index]["blog"],
                              softWrap: true,
                              style: TextStyle(color: greycolor),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis)
                        ],
                      ),
                    )),
              );
            }),
      ),
    );
  }

  SizedBox part2() {
    return SizedBox(
      width: 1000,
      height: 500,
      child: SingleChildScrollView(
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                mainAxisExtent: 100,
                childAspectRatio: 7,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30),
            itemCount: savedblogs.length,
            itemBuilder: (BuildContext ctx, index) {
              return SizedBox(
                width: 100,
                height: 100,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                savedblogs[index]["topic"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () async {
                                  String uid =
                                      FirebaseAuth.instance.currentUser.uid;
                                  savedblogs
                                          .where((element) =>
                                              element["id"] ==
                                              allblogdata[index]["id"])
                                          .toList()
                                          .isEmpty
                                      ? await FirebaseFirestore.instance
                                          .collection(
                                              "/AppData/Blogs/Blogdata/${allblogdata[index]["id"]}/saved/")
                                          .doc(uid)
                                          .set({"uid": uid})
                                      : await FirebaseFirestore.instance
                                          .collection(
                                              "/AppData/Blogs/Blogdata/${allblogdata[index]["id"]}/saved/")
                                          .doc(uid)
                                          .delete();

                                  savedblogsfunc();
                                  setState(() {});
                                },
                                child: Image.asset(
                                  savedblogs
                                          .where((element) =>
                                              element["id"] ==
                                              savedblogs[index]["id"])
                                          .toList()
                                          .isEmpty
                                      ? "assets/sa@2x.png"
                                      : "assets/filled@2x.png",
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                          Text(savedblogs[index]["blog"],
                              softWrap: true,
                              style: TextStyle(color: greycolor),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis)
                        ],
                      ),
                    )),
              );
            }),
      ),
    );
  }

  SizedBox part1(BuildContext context) {
    return SizedBox(
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              issaved
                  ? "Saved Blogs"
                  : ismyblog
                      ? "My Blogs"
                      : "Blogs",
              style: TextStyle(color: whitecolor, fontWeight: FontWeight.bold)),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    issaved = !issaved;
                    ismyblog = false;
                  });
                },
                child: Image.asset(
                  issaved ? "assets/filled@2x.png" : "assets/sa@2x.png",
                  width: 20,
                  height: 20,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    issaved = false;
                    ismyblog = !ismyblog;
                  });
                },
                child: Card(
                  color: ismyblog ? greencolor : whitecolor,
                  child: SizedBox(
                    width: 80,
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(children: [
                        Text(
                          "  My Blog  ",
                          style: TextStyle(
                              color:

                                  // ismyblog ? whitecolor :
                                  Colors.black),
                        ),
                      ]),
                    ),
                  ),
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
                      builder: (BuildContext context) => UploadBlog(),
                    ),
                  );
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
        ],
      ),
    );
  }
}
