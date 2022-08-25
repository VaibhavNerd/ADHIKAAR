import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
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

class BuyNational extends StatefulWidget {
  BuyNational(this.val);
  String val;
  @override
  _BuyNationalState createState() => _BuyNationalState();
}

class _BuyNationalState extends State<BuyNational> {
  final List<String> _listItem = [
    'assets/images/weekone.jpg',
    'assets/images/weektwo.jpg',
    'assets/images/drakeone.jpg',
    'assets/images/draketwo.jpg',
    'assets/images/weekone.jpg',
    'assets/images/weektwo.jpg',
    'assets/images/drakeone.jpg',
    'assets/images/draketwo.jpg',
    'assets/images/weekone.jpg',
    'assets/images/weektwo.jpg',
    'assets/images/drakeone.jpg',
    'assets/images/draketwo.jpg',
  ];
  List<String> state = [
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
    'IPR name',
  ];
  List<String> des = [
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
    'price',
  ];
  List<String> links = [
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=bNtOvlT9ZCQ&list=RDbNtOvlT9ZCQ&start_radio=1',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
    'https://www.youtube.com/watch?v=VafTMsrnSTU',
  ];
  String linktosend = "";
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
      }
    });
  }

  @override
  void initState() {
    getdata();
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
                                Container(
                                  margin: EdgeInsets.only(left: 120),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 55),
                                    child:
                                        Text("Price: ${iprs[index]["price"]}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            )),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(120, 70, 0, 0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "BUY",
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
