import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ipr/model/ipr_model.dart';
import 'package:ipr/patent_forms/form1.dart';
import 'package:ipr/patent_forms/form2.dart';
import 'package:ipr/services/firebase_services.dart';

class AgentList extends StatefulWidget {
  AgentList(this.agents);
  List agents;
  @override
  State<AgentList> createState() => _AgentListState();
}

class _AgentListState extends State<AgentList> {
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
              itemCount: widget.agents.length,
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
                            widget.agents[index]["name"],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              " Address: ${widget.agents[index]["address"]}",
                              style: TextStyle(color: Colors.white)),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white, size: 30.0)),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
