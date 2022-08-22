import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ipr/strings/patent_form1.dart';
class PatentForm1 extends StatefulWidget {
  const PatentForm1({Key key}) : super(key: key);

  @override
  State<PatentForm1> createState() => _PatentForm1State();
}

class _PatentForm1State extends State<PatentForm1> {
  List<GlobalKey<FormState>> _formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(),GlobalKey<FormState>()];
  int _activeStepIndex = 0;

  //Patentform1_Page1_Varaibles
  TextEditingController name1 = TextEditingController();
  TextEditingController nationality1 = TextEditingController();
  TextEditingController residence1 = TextEditingController();
  TextEditingController address1 = TextEditingController();

  String typeOfApplValue = "";
  String categOfApplValue = "";
  String inventorSameValue = "";

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
  TextEditingController filing_date2_3= TextEditingController();

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
      content:Container( //color: Colors.red,

        child: SingleChildScrollView ( child:
            Form( key: _formKeys[0],
              child:
        Column ( children: [


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
                  ...dropDownListData.map<DropdownMenuItem<String>>((e) {
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
           Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:[
            Align(alignment: Alignment.topRight,
            child:
            Text(" Applicants",
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,),),),
             Align( alignment: Alignment.topRight,
               child:
               Container(
                 //color: Colors.green,
                 width: 80,

                 child: Row ( children: [
                   GestureDetector(

                     child: Icon(Icons.add_circle_rounded, color: Colors.blueAccent,size: 18,),
                     onTap: (){},
                   ), SizedBox(width: 2,),
                   Text('Add new',
                     style: TextStyle(fontSize: 12),),
                 ],),
               ),),

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
            decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                Radius.circular(8.0),),),
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
            decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                Radius.circular(8.0),),),
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
            decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                Radius.circular(8.0),),),
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
            decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                Radius.circular(8.0),),),
              labelText: 'Address',
            ),),
          const SizedBox(
            height: 5,
          ),


          InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child:
            DropdownButtonHideUnderline(
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
                  ...categoryOfApplicant.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem(
                        child: Text(e['title']), value: e['value']);
                  }).toList(),
                ],
                onChanged: (newValue) {
                  setState(
                        () {
                      categOfApplValue = newValue;
                      if(categOfApplValue==""){


                      }
                      print(categOfApplValue);
                    },
                  );
                },
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          Align(
            alignment : Alignment.topLeft,
            child:
            Text(" Are all the inventor(s) same as the applicant(s) named above?",
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,),),),
          const SizedBox(
            height: 4,
          ),
          InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child:
            DropdownButtonHideUnderline(
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
                      if(inventorSame==""){
                        print("plzxx seelct value");

                      }

                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10,)

        ]),
        ),
        ),
      ),
    ),





    Step(
      state:
      _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 1,
      title: const Text('2'),
      content: Container(
        child:
        Form( key: _formKeys[1],
          child: Column(
            children: [
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
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Title Of The Invention',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment : Alignment.topLeft,
                child:
                Text(" AUTHORISED REGISTERED PATENT AGENT(S)",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,),),),
              const SizedBox(
                height: 4,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  contentPadding: const EdgeInsets.all(10),
                ),
                child:
                DropdownButtonHideUnderline(
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
                          authorizedAgentValue = newValue;
                          if(authorizedAgentValue==""){
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

              Align(
                alignment : Alignment.topLeft,
                child:
                Text(" IF YES",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,),),),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: name2_1,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Name',
                ),
              ), const SizedBox(
                height: 8,
              ),

              TextFormField(
                controller: mobile2_1,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Mobile',
                ),
              ), const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: email2_1,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'E-mail ID',
                ),
              ), const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: address2_1,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Postal Address',
                ),
              ), const SizedBox(
                height: 12,
              ),


              Align(
                alignment : Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 3),
                  child:
                  Text("IN CASE OF APPLICATION CLAIMING PRIORITY OF APPLICATION FILED IN CONVENTION COUNTRY, PARTICULARS OF CONVENTION APPLICATION",
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,),),),),
              const SizedBox(
                height: 4,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  contentPadding: const EdgeInsets.all(10),
                ),
                child:
                DropdownButtonHideUnderline(
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
                          if(appClaimingValue==""){
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

              Align(
                alignment : Alignment.topLeft,
                child:
                Text(" IF YES",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,),),),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: country2_1,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Country',
                ),
              ), const SizedBox(
                height: 8,
              ),

              TextFormField(
                controller: appl_no2_1,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Application No.',
                ),
              ), const SizedBox(
                height: 8,
              ),
              TextFormField(

                controller: appl_name2_1,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Name Of Applicant',
                ),
              ), const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: address2_2,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Postal Address',
                ),
              ), const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: filing_date2_1,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },

                onTap: () async { DateTime pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1974),
                    lastDate: DateTime(2101));

                if (pickeddate != null) {

                  setState(() {filing_date2_1.text = DateFormat('dd-MM-yyyy').format(pickeddate);
                  });
                }
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),

                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                //  icon: Icon(Icons.calendar_today_rounded,),
                  labelText: 'Filing Date(dd/mm/yyyy)',
                ),
              ), const SizedBox(
                height: 8,
              ),

              TextFormField(
                controller: title_inv2_1,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Title Of Invention',
                ),
              ), const SizedBox(
                height: 8,
              ),

              TextFormField(
                controller: ipc2,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'IPC',
                ),
              ), const SizedBox(
                height: 12,
              ),

              Align(
                alignment : Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 3),
                  child:
                  Text("IN CASE OF PCT NATIONAL PHASE APPLICATION, PARTICULARS OF INTERNATIONAL APPLICATION FILED UNDER PATENT CO-OPERATION TREATY (PCT)",
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,),),),),
              const SizedBox(
                height: 4,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  contentPadding: const EdgeInsets.all(10),
                ),
                child:
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(

                    value:nationalPhaseValue,

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
                          if(nationalPhaseValue==""){
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

              Align(
                alignment : Alignment.topLeft,
                child:
                Text(" IF YES",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,),),),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: int_appl_no2,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'international application number',
                ),
              ), const SizedBox(
                height: 8,
              ),

              TextFormField(
                controller: filing_date2_2,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },

                onTap: () async { DateTime pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1974),
                    lastDate: DateTime(2101));

                if (pickeddate != null) {

                  setState(() {filing_date2_2.text = DateFormat('dd-MM-yyyy').format(pickeddate);
                  });
                }
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),

                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'International filing date (dd/mm/yyyy)',
                ),
              ), const SizedBox(
                height: 8,
              ),

              Align(
                alignment : Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 3),
                  child:
                  Text("IN CASE OF PATENT OF ADDITION FILED UNDER SECTION 54, PARTICULARS OF MAIN APPLICATION OR PATENT",
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,),),),),
              const SizedBox(
                height: 4,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  contentPadding: const EdgeInsets.all(10),
                ),
                child:
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(

                    value:section54Value,

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
                          if(section54Value==""){
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

              Align(
                alignment : Alignment.topLeft,
                child:
                Text(" IF YES",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,),),),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: patent_no2,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Main application/patet No.',
                ),
              ), const SizedBox(
                height: 8,
              ),

              TextFormField(
                controller: filing_date2_3,
                validator: (value) {
                  if (value.isEmpty) {
                    return ("Feild can't be empty");
                  }
                  return null;
                },
                onTap: () async { DateTime pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1974),
                    lastDate: DateTime(2101));

                if (pickeddate != null) {

                  setState(() {filing_date2_3.text = DateFormat('dd-MM-yyyy').format(pickeddate);
                  });
                }
                },
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),

                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Date of filing main application',
                ),
              ), const SizedBox(
                height: 8,
              ),
            ]  ),
        ),
      ),
    ),


    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text('3'),
        content: Container(
            child: Form( key: _formKeys[2],
                child :
            Flexible( child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  Row(
                      children: <Widget>[
                        Text('Declarations by the inventor(s)',
                          style: TextStyle(fontSize: 18),),
                        SizedBox(width: 5,),

                        GestureDetector(onTap: (){

                          showDialog(context: context, builder:(context){
                            return
                              Container(
                                child: AlertDialog(
                                  title: Text("Declaration by the inventor(s)",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                                  actions: [TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text("OK"))],
                                  content: Container(
                                    child: SingleChildScrollView(
                                      child: Text(
                                          invDeclaraions
                                      ),
                                    ),
                                  ),
                                ),

                              );
                          } );

                        }, child:
                        Icon(Icons.info_outline_rounded, color: Colors.blueAccent,size: 18,),
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
                    decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),),),
                      labelText: 'Date',
                    ),
                  ), const SizedBox(
                    height: 2,
                  ),
                  Row( children :[
                    Text('Signature(s)',
                      style: TextStyle(fontSize: 18),),
                    SizedBox(width: 20,),
                    ElevatedButton( onPressed: (){}, child: Text("Add +",style: TextStyle(fontSize: 12),), style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: Size(15, 25)),)
                  ]),
                  SizedBox(height: 2,),

                  Column(

                      children: [

                        TextFormField(
                          controller: names3_1,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Feild can't be empty");
                            }
                            return null;
                          },
                          decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),),),
                            labelText: 'Names',
                          ),
                        ), SizedBox(height: 2,),
                        Container(  child:
                        Align( alignment: Alignment.topRight,
                          child:
                          Container(
                            //color: Colors.green,
                            width: 80,

                            child: Row ( children: [
                              GestureDetector(

                                child: Icon(Icons.add_circle_rounded, color: Colors.blueAccent,size: 18,),
                                onTap: (){},
                              ), SizedBox(width: 2,),
                              Text('Add new',
                                style: TextStyle(fontSize: 12),),
                            ],),
                          ),),
                        ), ]),

                  const SizedBox(
                    height: 8,
                  ),
                  Text('Declaration by the applicant(s) in the ',
                    style: TextStyle(fontSize: 18),),
                  Row(
                      children: <Widget>[
                        Container(
                            child: Flexible( child:
                            Column( children: <Widget>[

                              Text('convention country',
                                style: TextStyle(fontSize: 18),),
                            ]))),

                        SizedBox(width: 5,),

                        GestureDetector(onTap: (){

                          showDialog(context: context, builder:(context){
                            return
                              Container(
                                child: AlertDialog(
                                  title: Text("Declaration by the applicant(s) in the convention country",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                                  actions: [TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text("OK"))],
                                  content: Container(
                                    child: SingleChildScrollView(
                                      child: Text(
                                          conDeclarations
                                      ),
                                    ),
                                  ),
                                ),

                              );
                          } );

                        }, child:
                        Icon(Icons.info_outline_rounded, color: Colors.blueAccent,size: 18,),
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
                    decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),),),
                      labelText: 'Date',
                    ),
                  ), const SizedBox(
                    height: 2,
                  ),
                  Row( children :[
                    Text('Signature(s)',
                      style: TextStyle(fontSize: 18),),
                    SizedBox(width: 20,),
                    ElevatedButton( onPressed: (){}, child: Text("Add +",style: TextStyle(fontSize: 12),),
                      style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: Size(15, 25)),)
                  ]),
                  SizedBox(height: 2,),

                  Column(

                      children: [

                        TextFormField(
                          controller: names3_2,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Feild can't be empty");
                            }
                            return null;
                          },
                          decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),),),
                            labelText: 'Names',
                          ),
                        ), SizedBox(height: 2,),
                        Container(  child:
                        Align( alignment: Alignment.topRight,
                          child:
                          Container(
                            //color: Colors.green,
                            width: 80,

                            child: Row ( children: [
                              GestureDetector(

                                child: Icon(Icons.add_circle_rounded, color: Colors.blueAccent,size: 18,),
                                onTap: (){},
                              ), SizedBox(width: 2,),
                              Text('Add new',
                                style: TextStyle(fontSize: 12),),
                            ],),
                          ),),
                        ), ]),

                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                      children: <Widget>[
                        Text('Declaration by the applicant(s)',
                          style: TextStyle(fontSize: 18),),
                        SizedBox(width: 5,),

                        GestureDetector(onTap: (){

                          showDialog(context: context, builder:(context){
                            return
                              Container(
                                child: AlertDialog(
                                  title: Text("Declaration by the applicant(s)",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                                  actions: [TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text("OK"))],
                                  content: Container(
                                    child: SingleChildScrollView(
                                      child: Text(
                                          appDeclarations
                                      ),
                                    ),
                                  ),
                                ),

                              );
                          } );

                        }, child:
                        Icon(Icons.info_outline_rounded, color: Colors.blueAccent,size: 18,),
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
                    decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),),),
                      labelText: 'Date',
                    ),
                  ), const SizedBox(
                    height: 2,
                  ),
                  Row( children :[
                    Text('Signature(s)',
                      style: TextStyle(fontSize: 18),),
                    SizedBox(width: 20,),
                    ElevatedButton( onPressed: (){}, child: Text("Add +",style: TextStyle(fontSize: 12),), style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: Size(15, 25)),)
                  ]),
                  SizedBox(height: 2,),

                  Column(

                      children: [

                        TextFormField(
                          controller: names3_3,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Feild can't be empty");
                            }
                            return null;
                          },
                          decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),),),
                            labelText: 'Names',
                          ),
                        ), SizedBox(height: 2,),
                        Container(  child:
                        Align( alignment: Alignment.topRight,
                          child:
                          Container(
                            //color: Colors.green,
                            width: 80,

                            child: Row ( children: [
                              GestureDetector(

                                child: Icon(Icons.add_circle_rounded, color: Colors.blueAccent,size: 18,),
                                onTap: (){},
                              ), SizedBox(width: 2,),
                              Text('Add new',
                                style: TextStyle(fontSize: 12),),
                            ],),
                          ),),

                        ), ]),


                  ElevatedButton( onPressed: (){}, child: Text("Upload Documents",style: TextStyle(fontSize: 15),),
                    style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: Size(15, 40)),)
                ]
            )))),),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stepper'),
      ),
      body:
        Stepper(

        controlsBuilder: (context, details) {
          return Row(
            children: <Widget>[

              ElevatedButton( onPressed: details.onStepContinue,child: Text("Next",style: TextStyle(fontSize: 15),),
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: Size(15, 40)),),
              SizedBox(width: 20,),
              ElevatedButton( onPressed: details.onStepCancel, child: Text("Cancel",style: TextStyle(fontSize: 15),),
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: Size(15, 40)),)
            ],
          );
        },

        physics: ClampingScrollPhysics(),
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        margin: EdgeInsets.only(top: 20),
        steps: stepList(),

        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1) && _formKeys[_activeStepIndex].currentState?.validate()) {
            setState(() {
              _activeStepIndex += 1;
            });
          } else {
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
}

