import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:ipr/patent_forms/ongoing_form.dart';
import 'package:ipr/services/firebase_services.dart';
import 'package:ipr/strings/patent_form1.dart';

class PatentForm1 extends StatefulWidget {
  PatentForm1(this.applicationid);
  String applicationid;
  @override
  State<PatentForm1> createState() => _PatentForm1State();
}

class _PatentForm1State extends State<PatentForm1> {
  List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  int _activeStepIndex = 0;

  //Patentform1_Page1_Varaibles
  TextEditingController name1 = TextEditingController();
  TextEditingController nationality1 = TextEditingController();
  TextEditingController residence1 = TextEditingController();
  TextEditingController address1 = TextEditingController();

  String typeOfApplValue = "";
  String categOfApplValue = "";
  String inventorSameValue = "";
  List applicant = [];
  List dropDownListData = [
    {"title": "BCA", "value": "1"},
    {"title": "MCA", "value": "2"},
    {"title": "B.Tech", "value": "3"},
    {"title": "M.Tech", "value": "4"},
  ];
  List categoryOfApplicant = [
    {"title": "Natural Person", "value": "1"},
    {"title": "Other than Natural Person", "value": "2"},
  ];
  List inventorSame = [
    {"title": "Yes", "value": "1"},
    {"title": "No", "value": "2"},
  ];

  //Patentform1_Page2_Varaibles
  TextEditingController title_inv2_1 = TextEditingController();
  TextEditingController name2_1 = TextEditingController();
  TextEditingController mobile2_1 = TextEditingController();
  TextEditingController email2_1 = TextEditingController();
  TextEditingController address2_1 = TextEditingController();
  TextEditingController country2_1 = TextEditingController();
  TextEditingController appl_no2_1 = TextEditingController();
  TextEditingController appl_name2_1 = TextEditingController();
  TextEditingController address2_2 = TextEditingController();
  TextEditingController filing_date2_1 = TextEditingController();
  TextEditingController title_inv2_2 = TextEditingController();
  TextEditingController ipc2 = TextEditingController();
  TextEditingController int_appl_no2 = TextEditingController();
  TextEditingController filing_date2_2 = TextEditingController();
  TextEditingController patent_no2 = TextEditingController();
  TextEditingController filing_date2_3 = TextEditingController();

  String authorizedAgentValue = "";
  String appClaimingValue = "";
  String nationalPhaseValue = "";
  String section54Value = "";

  List authorizedAgent = [
    {"title": "Yes", "value": "1"},
    {"title": "No", "value": "2"},
  ];
  List appClaiming = [
    {"title": "Yes", "value": "1"},
    {"title": "No", "value": "2"},
  ];
  List nationalPhase = [
    {"title": "Yes", "value": "1"},
    {"title": "No", "value": "2"},
  ];
  List section54 = [
    {"title": "Yes", "value": "1"},
    {"title": "No", "value": "2"},
  ];

  //Patentform1_Page2_Varaibles

  List signature3_1 = [];
  List signature3_2 = [];
  List signature3_3 = [];
  TextEditingController date3_1 = TextEditingController();
  TextEditingController names3_1 = TextEditingController();
  TextEditingController date3_2 = TextEditingController();
  TextEditingController names3_2 = TextEditingController();
  TextEditingController date3_3 = TextEditingController();
  TextEditingController names3_3 = TextEditingController();

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('1'),
          content: Container(
            //color: Colors.red,

            child: SingleChildScrollView(
              child: Form(
                key: _formKeys[0],
                child: Column(children: [
                  InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: typeOfApplValue,
                        isDense: true,
                        isExpanded: true,
                        menuMaxHeight: 350,
                        items: [
                          const DropdownMenuItem(
                              child: Text(
                                "Type Of Applicantion",
                              ),
                              value: ""),
                          ...dropDownListData
                              .map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                                child: Text(e['title']), value: e['value']);
                          }).toList(),
                        ],
                        onChanged: (newValue) {
                          setState(
                            () {
                              typeOfApplValue = newValue;
                              print(typeOfApplValue);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: applicant.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
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
                                              "Category: ${applicant[index]["category"]}"),
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
                                              "Nationality: ${applicant[index]["nationality"]}"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              "Country: ${applicant[index]["country"]}"),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              "Address: ${applicant[index]["address"]}"),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      applicant.removeAt(index);
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 12,
                                    child: Icon(
                                      Icons.delete,
                                      size: 15,
                                      color: Colors.red,
                                    ),
                                  ),
                                ))
                          ],
                        );
                      }),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            " Applicants",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: name1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return ("Value can't be empty");
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
                    controller: nationality1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return ("Value is empty");
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
                  TextFormField(
                    controller: residence1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return ("Value is empty");
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
                      labelText: 'Country of Residence',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: address1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return ("Value is empty");
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
                      labelText: 'Address',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: categOfApplValue,
                        isDense: true,
                        isExpanded: true,
                        menuMaxHeight: 350,
                        items: [
                          const DropdownMenuItem(
                              child: Text(
                                "Category Of Applicant",
                              ),
                              value: ""),
                          ...categoryOfApplicant
                              .map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                                child: Text(e['title']), value: e['value']);
                          }).toList(),
                        ],
                        onChanged: (newValue) {
                          setState(
                            () {
                              categOfApplValue = newValue;
                              if (categOfApplValue == "") {}
                              print(categOfApplValue);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      if (_formKeys[_activeStepIndex]
                          .currentState
                          ?.validate()) {
                        setState(() {
                          applicant.add({
                            'name': name1.text,
                            'nationality': nationality1.text,
                            'country': residence1.text,
                            'address': address1.text,
                            'category': categOfApplValue
                          });
                        });

                        // setState(() {
                        //   name1.text = "";
                        //   nationality1.text = "";
                        //   residence1.text = "";
                        //   address1.text = "";
                        // });
                      }

                      print(applicant.length);
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          //color: Colors.green,
                          width: 100,

                          child: Row(
                            children: [
                              Icon(
                                Icons.add_circle_rounded,
                                color: Colors.blueAccent,
                                size: 25,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Add new',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Are all the inventor(s) same as the applicant(s) named above?",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: inventorSameValue,
                        isDense: true,
                        isExpanded: true,
                        menuMaxHeight: 350,
                        items: [
                          const DropdownMenuItem(
                              child: Text(
                                "Select",
                              ),
                              value: ""),
                          ...inventorSame.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                                child: Text(e['title']), value: e['value']);
                          }).toList(),
                        ],
                        onChanged: (newValue) {
                          setState(
                            () {
                              inventorSameValue = newValue;
                              if (inventorSame == "") {
                                print("plzxx seelct value");
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ]),
              ),
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('2'),
          content: Container(
            child: Form(
              key: _formKeys[1],
              child: Column(children: [
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: title_inv2_1,
                  validator: (value) {
                    if (value.isEmpty) {
                      return ("Value is empty");
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
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    " AUTHORISED REGISTERED PATENT AGENT(S)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: authorizedAgentValue,
                      isDense: true,
                      isExpanded: true,
                      menuMaxHeight: 350,
                      items: [
                        const DropdownMenuItem(
                            child: Text(
                              "Select",
                            ),
                            value: ""),
                        ...authorizedAgent.map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                              child: Text(e['title']), value: e['value']);
                        }).toList(),
                      ],
                      onChanged: (newValue) {
                        setState(
                          () {
                            print("I am here");
                            print(newValue);
                            authorizedAgentValue = newValue;
                            if (authorizedAgentValue == "") {
                              print("plzxx seelct value");
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                authorizedAgentValue == "1"
                    ? Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              " IF YES",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            controller: name2_1,
                            validator: (value) {
                              if (value.isEmpty &&
                                  authorizedAgentValue == "1") {
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
                            controller: mobile2_1,
                            validator: (value) {
                              if (value.isEmpty &&
                                  authorizedAgentValue == "1") {
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
                              labelText: 'Mobile',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: email2_1,
                            validator: (value) {
                              if (value.isEmpty &&
                                  authorizedAgentValue == "1") {
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
                              labelText: 'E-mail ID',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: address2_1,
                            validator: (value) {
                              if (value.isEmpty &&
                                  authorizedAgentValue == "1") {
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
                              labelText: 'Postal Address',
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Text(
                      "IN CASE OF APPLICATION CLAIMING PRIORITY OF APPLICATION FILED IN CONVENTION COUNTRY, PARTICULARS OF CONVENTION APPLICATION",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: appClaimingValue,
                      isDense: true,
                      isExpanded: true,
                      menuMaxHeight: 350,
                      items: [
                        const DropdownMenuItem(
                            child: Text(
                              "Select",
                            ),
                            value: ""),
                        ...appClaiming.map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                              child: Text(e['title']), value: e['value']);
                        }).toList(),
                      ],
                      onChanged: (newValue) {
                        setState(
                          () {
                            appClaimingValue = newValue;
                            if (appClaimingValue == "") {
                              print("plzxx seelct value");
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                appClaimingValue == "1"
                    ? Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              " IF YES",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            controller: country2_1,
                            validator: (value) {
                              if (value.isEmpty && appClaimingValue == "1") {
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
                              labelText: 'Country',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: appl_no2_1,
                            validator: (value) {
                              if (value.isEmpty && appClaimingValue == "1") {
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
                              labelText: 'Application No.',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: appl_name2_1,
                            validator: (value) {
                              if (value.isEmpty && appClaimingValue == "1") {
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
                              labelText: 'Name Of Applicant',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: address2_2,
                            validator: (value) {
                              if (value.isEmpty && appClaimingValue == "1") {
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
                              labelText: 'Postal Address',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: filing_date2_1,
                            validator: (value) {
                              if (value.isEmpty && appClaimingValue == "1") {
                                return ("Feild can't be empty");
                              }
                              return null;
                            },
                            onTap: () async {
                              DateTime pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1974),
                                  lastDate: DateTime(2101));

                              if (pickeddate != null) {
                                setState(() {
                                  filing_date2_1.text = DateFormat('dd-MM-yyyy')
                                      .format(pickeddate);
                                });
                              }
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),

                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              //  icon: Icon(Icons.calendar_today_rounded,),
                              labelText: 'Filing Date(dd/mm/yyyy)',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: title_inv2_2,
                            validator: (value) {
                              if (value.isEmpty && appClaimingValue == "1") {
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
                              labelText: 'Title Of Invention',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: ipc2,
                            validator: (value) {
                              if (value.isEmpty && appClaimingValue == "1") {
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
                              labelText: 'IPC',
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Text(
                      "IN CASE OF PCT NATIONAL PHASE APPLICATION, PARTICULARS OF INTERNATIONAL APPLICATION FILED UNDER PATENT CO-OPERATION TREATY (PCT)",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: nationalPhaseValue,
                      isDense: true,
                      isExpanded: true,
                      menuMaxHeight: 350,
                      items: [
                        const DropdownMenuItem(
                            child: Text(
                              "Select",
                            ),
                            value: ""),
                        ...nationalPhase.map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                              child: Text(e['title']), value: e['value']);
                        }).toList(),
                      ],
                      onChanged: (newValue) {
                        setState(
                          () {
                            nationalPhaseValue = newValue;
                            if (nationalPhaseValue == "") {
                              print("plzxx seelct value");
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                nationalPhaseValue == "1"
                    ? Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              " IF YES",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            controller: int_appl_no2,
                            validator: (value) {
                              if (value.isEmpty && nationalPhaseValue == "1") {
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
                              labelText: 'international application number',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: filing_date2_2,
                            validator: (value) {
                              if (value.isEmpty && nationalPhaseValue == "1") {
                                return ("Feild can't be empty");
                              }
                              return null;
                            },
                            onTap: () async {
                              DateTime pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1974),
                                  lastDate: DateTime(2101));

                              if (pickeddate != null) {
                                setState(() {
                                  filing_date2_2.text = DateFormat('dd-MM-yyyy')
                                      .format(pickeddate);
                                });
                              }
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              labelText:
                                  'International filing date (dd/mm/yyyy)',
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Text(
                      "IN CASE OF PATENT OF ADDITION FILED UNDER SECTION 54, PARTICULARS OF MAIN APPLICATION OR PATENT",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: section54Value,
                      isDense: true,
                      isExpanded: true,
                      menuMaxHeight: 350,
                      items: [
                        const DropdownMenuItem(
                            child: Text(
                              "Select",
                            ),
                            value: ""),
                        ...section54.map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                              child: Text(e['title']), value: e['value']);
                        }).toList(),
                      ],
                      onChanged: (newValue) {
                        setState(
                          () {
                            section54Value = newValue;
                            if (section54Value == "") {
                              print("plzxx seelct value");
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                section54Value == "1"
                    ? Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              " IF YES",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            controller: patent_no2,
                            validator: (value) {
                              if (value.isEmpty && section54Value == "1") {
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
                              labelText: 'Main application/patet No.',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: filing_date2_3,
                            validator: (value) {
                              if (value.isEmpty && section54Value == "1") {
                                return ("Feild can't be empty");
                              }
                              return null;
                            },
                            onTap: () async {
                              DateTime pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1974),
                                  lastDate: DateTime(2101));

                              if (pickeddate != null) {
                                setState(() {
                                  filing_date2_3.text = DateFormat('dd-MM-yyyy')
                                      .format(pickeddate);
                                });
                              }
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              labelText: 'Date of filing main application',
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 8,
                ),
              ]),
            ),
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('3'),
          content: Container(
              child: Form(
                  key: _formKeys[2],
                  child: Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Row(children: <Widget>[
                          Text(
                            'Declarations by the inventor(s)',
                            style: TextStyle(fontSize: 18),
                          ),
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
                                          "Declaration by the inventor(s)",
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
                                            child: Text(invDeclaraions),
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: date3_1,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Feild can't be empty");
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1974),
                                lastDate: DateTime(2101));

                            if (pickeddate != null) {
                              setState(() {
                                date3_1.text =
                                    DateFormat('dd-MM-yyyy').format(pickeddate);
                              });
                            }
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),

                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            //  icon: Icon(Icons.calendar_today_rounded,),
                            labelText: 'Filing Date(dd/mm/yyyy)',
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(children: [
                          Text(
                            'Signature(s)',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              String url = await getAndUpload();
                              setState(() {
                                signature3_1.add(url);
                              });
                            },
                            child: Text(
                              "Add +",
                              style: TextStyle(fontSize: 12),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                minimumSize: Size(15, 25)),
                          )
                        ]),
                        SizedBox(
                          height: 2,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: signature3_1.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: <Widget>[
                                  Container(
                                      height: 55,
                                      width: 60,
                                      child:
                                          Image.network(signature3_1[index])),
                                  Positioned(
                                    top: -15,
                                    right: -15,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: IconButton(
                                        hoverColor: Colors.red,
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 23,
                                        ),
                                        // onPressed: () =>
                                        //    _removeVideo
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                        Column(children: [
                          SizedBox(
                            height: 2,
                          ),
                        ]),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Declaration by the applicant(s) in the ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(children: <Widget>[
                          Container(
                              child: Flexible(
                                  child: Column(children: <Widget>[
                            Text(
                              'convention country',
                              style: TextStyle(fontSize: 18),
                            ),
                          ]))),
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
                                            child: Text(conDeclarations),
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: date3_2,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Feild can't be empty");
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1974),
                                lastDate: DateTime(2101));

                            if (pickeddate != null) {
                              setState(() {
                                date3_2.text =
                                    DateFormat('dd-MM-yyyy').format(pickeddate);
                              });
                            }
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),

                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            //  icon: Icon(Icons.calendar_today_rounded,),
                            labelText: 'Filing Date(dd/mm/yyyy)',
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(children: [
                          Text(
                            'Signature(s)',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              String url = await getAndUpload();
                              setState(() {
                                signature3_2.add(url);
                              });
                            },
                            child: Text(
                              "Add +",
                              style: TextStyle(fontSize: 12),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                minimumSize: Size(15, 25)),
                          )
                        ]),
                        SizedBox(
                          height: 2,
                        ),
                        Column(children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: signature3_2.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  children: <Widget>[
                                    Container(
                                        height: 55,
                                        width: 60,
                                        child:
                                            Image.network(signature3_2[index])),
                                    Positioned(
                                      top: -15,
                                      right: -15,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: IconButton(
                                          hoverColor: Colors.red,
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 23,
                                          ),
                                          // onPressed: () =>
                                          //    _removeVideo
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                          SizedBox(
                            height: 2,
                          ),
                        ]),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(children: <Widget>[
                          Text(
                            'Declaration by the applicant(s)',
                            style: TextStyle(fontSize: 18),
                          ),
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
                                          "Declaration by the applicant(s)",
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
                                            child: Text(appDeclarations),
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: date3_3,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Feild can't be empty");
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1974),
                                lastDate: DateTime(2101));

                            if (pickeddate != null) {
                              setState(() {
                                date3_3.text =
                                    DateFormat('dd-MM-yyyy').format(pickeddate);
                              });
                            }
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),

                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            //  icon: Icon(Icons.calendar_today_rounded,),
                            labelText: 'Filing Date(dd/mm/yyyy)',
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(children: [
                          Text(
                            'Signature(s)',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              String url = await getAndUpload();
                              setState(() {
                                signature3_3.add(url);
                              });
                            },
                            child: Text(
                              "Add +",
                              style: TextStyle(fontSize: 12),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                minimumSize: Size(15, 25)),
                          )
                        ]),
                        SizedBox(
                          height: 2,
                        ),
                        Column(children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: signature3_3.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  children: <Widget>[
                                    Container(
                                        height: 55,
                                        width: 60,
                                        child:
                                            Image.network(signature3_3[index])),
                                    Positioned(
                                      top: -15,
                                      right: -15,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: IconButton(
                                          hoverColor: Colors.red,
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 23,
                                          ),
                                          // onPressed: () =>
                                          //    _removeVideo
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ]),
                      ])))),
        ),
      ];
  Map<String, dynamic> data = {};
  Map<String, dynamic> data1 = {};
  getipr() async {
    data1 = (await getformdatafromid(widget.applicationid));
    data = data1['form1'] ?? {};
    setState(() {
      data;
      data1;
    });
    print(data);
    setState(() {
      typeOfApplValue = data['type_of_application'] ?? "";
      applicant = data['applicant'] ?? [];
      inventorSameValue = data['inventor_same_as_applicant'] ?? "";
      title_inv2_1.text = data['title_of_invention'] ?? "";
      authorizedAgentValue = data['authorized_patent_agent'] ?? "";
      name2_1.text = data['name2_1'] ?? '';
      mobile2_1.text = data['mobile2_1'] ?? '';
      email2_1.text = data['email2_1'] ?? '';
      address2_1.text = data['address2_1'] ?? '';
      country2_1.text = data['country2_1'] ?? '';
      appClaimingValue = data['application_claiming'] ?? '';
      appl_no2_1.text = data['appl_no2_1'];
      appl_name2_1.text = data['appl_name2_1'] ?? '';
      address2_2.text = data['address2_2'] ?? '';
      filing_date2_1.text = data['filing_date2_1'] ?? '';
      title_inv2_2.text = data['title_inv2_2'] ?? '';
      ipc2.text = data['ipc2'] ?? '';
      nationalPhaseValue = data['nationalPhaseValue'] ?? '';
      int_appl_no2.text = data['int_appl_no2'] ?? '';
      filing_date2_2.text = data['filing_date2_2'] ?? '';
      section54Value = data['section54Value'] ?? '';
      patent_no2.text = data['patent_no2'] ?? '';
      filing_date2_3.text = data['filing_date2_3'];
      date3_1.text = data['date3_1'];
      date3_2.text = data['date3_2'];
      date3_3.text = data['date3_3'];
      signature3_1 = data['signature3_1'] ?? [];
      signature3_2 = data['signature3_2'] ?? [];
      signature3_3 = data['signature3_3'] ?? [];
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
        title: const Text('Flutter Stepper'),
      ),
      body: Stepper(
        controlsBuilder: (context, details) {
          return Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent, minimumSize: Size(15, 40)),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: details.onStepCancel,
                child: Text(
                  "Cancel",
                  style: TextStyle(fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent, minimumSize: Size(15, 40)),
              )
            ],
          );
        },
        physics: ClampingScrollPhysics(),
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        margin: EdgeInsets.only(top: 20),
        steps: stepList(),
        onStepContinue: () {
          print("hello");
          print(_activeStepIndex);
          if (_activeStepIndex < (stepList().length) &&
              _formKeys[_activeStepIndex].currentState?.validate()) {
            if (_activeStepIndex == 0) {
              Map<String, dynamic> data = {
                'type_of_application': typeOfApplValue,
                'applicant': applicant,
                'inventor_same_as_applicant': inventorSameValue,
              };
              String uid = FirebaseAuth.instance.currentUser.uid;
              FirebaseFirestore.instance
                  .doc("users/$uid/forms/${widget.applicationid}")
                  .set({
                "form1": data,
                'timewhenlastchanged': DateTime.now().toString()
              }, SetOptions(merge: true));
            }
            if (_activeStepIndex == 1) {
              Map<String, dynamic> data = {
                'title_of_invention': title_inv2_1.text,
                'authorized_patent_agent': authorizedAgentValue,
                'name2_1': name2_1.text,
                'mobile2_1': mobile2_1.text,
                'email2_1': email2_1.text,
                'address2_1': address2_1.text,
                'country2_1': country2_1.text,
                'application_claiming': appClaimingValue,
                'appl_no2_1': appl_no2_1.text,
                'appl_name2_1': appl_name2_1.text,
                'address2_2': address2_2.text,
                'filing_date2_1': filing_date2_1.text,
                'title_inv2_2': title_inv2_2.text,
                'ipc2': ipc2.text,
                'nationalPhaseValue': nationalPhaseValue,
                'int_appl_no2': int_appl_no2.text,
                'filing_date2_2': filing_date2_2.text,
                'section54Value': section54Value,
                'patent_no2': patent_no2.text,
                'filing_date2_3': filing_date2_3.text
              };

              String uid = FirebaseAuth.instance.currentUser.uid;
              FirebaseFirestore.instance
                  .doc("users/$uid/forms/${widget.applicationid}")
                  .set({
                "form1": data,
                'timewhenlastchanged': DateTime.now().toString()
              }, SetOptions(merge: true));
            }
            if (_activeStepIndex == 2) {
              Map<String, dynamic> data = {
                'date3_1': date3_1.text,
                'date3_2': date3_2.text,
                'date3_3': date3_3.text,
                'signature3_1': signature3_1,
                'signature3_2': signature3_2,
                'signature3_3': signature3_3
              };

              String uid = FirebaseAuth.instance.currentUser.uid;
              FirebaseFirestore.instance
                  .doc("users/$uid/forms/${widget.applicationid}")
                  .set({"form1": data}, SetOptions(merge: true)).then((value) {
                List formdone = ((data1["formsdone"] ?? []));
                formdone.add(1);
                print((data1["formsdone"] ?? []));
                FirebaseFirestore.instance
                    .doc("users/$uid/forms/${widget.applicationid}")
                    .set({
                  "formsdone": formdone,
                  'timewhenlastchanged': DateTime.now().toString(),
                  'update': "Form 1 Completed"
                }, SetOptions(merge: true)).then((value) {
                  Fluttertoast.showToast(
                      msg: "Your application submitted successfully!!!",
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
            if (_activeStepIndex < 2)
              setState(() {
                _activeStepIndex += 1;
              });
          } else {
            if (_formKeys[2].currentState?.validate()) {}

            print('Submited');
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }

          setState(() {
            _activeStepIndex -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },
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
