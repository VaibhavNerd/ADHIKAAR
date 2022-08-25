import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ipr/model/ipr_model.dart';
import 'package:ipr/patent_forms/form1.dart';
import 'package:ipr/patent_forms/form2.dart';
import 'package:ipr/services/firebase_services.dart';

class InternationalBuy extends StatefulWidget {
  InternationalBuy(this.iprs);
  List iprs;
  @override
  State<InternationalBuy> createState() => _InternationalBuyState();
}

class _InternationalBuyState extends State<InternationalBuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.iprs.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute<void>(
                      //     builder: (BuildContext context) =>
                      //         PatentForm1(widget.applicationid),
                      //   ),
                      // );
                    },
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(64, 75, 96, .9)),
                        child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            title: Text(
                              widget.iprs[index]["inventionTitle"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              children: [
                                Text(
                                    " Patent Number: ${widget.iprs[index]["patentNumber"].toString()}",
                                    style: TextStyle(color: Colors.white)),
                                Text(
                                    " Grant Date: ${widget.iprs[index]["grantDate"].toString()}",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white, size: 30.0)),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
