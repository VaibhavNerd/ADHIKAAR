import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ipr/model/ipr_model.dart';
import 'package:ipr/patent_forms/form1.dart';
import 'package:ipr/patent_forms/form2.dart';
import 'package:ipr/services/firebase_services.dart';

class AllPayment extends StatefulWidget {
  AllPayment();
  @override
  State<AllPayment> createState() => _AllPaymentState();
}

class _AllPaymentState extends State<AllPayment> {
  List payments = [];
  void getpayment() async {
    payments = await getpaymentdatafromid();
    setState(() {
      payments;
    });
  }

  @override
  void initState() {
    getpayment();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: payments.length,
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
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        title: Text(
                          payments[index]["paymentId"],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(" ${payments[index]["time"].substring(0, 16)}",
                                style: TextStyle(color: Colors.white)),
                            Text(" ${payments[index]["reason"]}",
                                style: TextStyle(color: Colors.white)),
                            Text("Application:  ${payments[index]["id"]}",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
