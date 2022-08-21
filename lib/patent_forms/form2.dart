import 'package:flutter/material.dart';
import 'package:ipr/strings/patent_form2.dart';
class PatentForm2 extends StatefulWidget {
  const PatentForm2({Key key}) : super(key: key);

  @override
  State<PatentForm2> createState() => _PatentForm2State();
}

class _PatentForm2State extends State<PatentForm2> {
  int _activeStepIndex = 0;

  TextEditingController title2 = TextEditingController();
  TextEditingController name2 = TextEditingController();
  TextEditingController nationality2 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController povisional2 = TextEditingController();
  TextEditingController complete2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: ListView ( children :[
        Padding(padding: EdgeInsets.all(20),
          child:
            Column( children:[SizedBox(
          height: 8,
        ),
          Align(alignment: Alignment.topLeft,
            child:
            Text(" Invention",
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,),),),
           SizedBox(
            height: 8,
          ),
          TextField(
            controller: title2,
            decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                Radius.circular(8.0),),),
              labelText: 'Title Of The Invention',
            ),
          ),SizedBox(height: 10,),
              Align(alignment: Alignment.topLeft,
                child:
                Text(" Applicant(s)",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,),),),

           const SizedBox(
            height: 8,
          ),
          TextField(
            controller: name2,
            decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                Radius.circular(8.0),),),
              labelText: 'Name',
            ),
          ),
              const SizedBox(
                height: 8,
          ),
              TextField(
                controller: name2,
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Nationality',
                ),
              ),
          const SizedBox(
              height: 8, ),
              TextField(
                controller: name2,
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Address',
                ),
              ),
              const SizedBox(
                height: 8, ),
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
              SizedBox(height: 10,),
              Align(alignment: Alignment.topLeft,
                child:
                Text(" Preamble To The Description",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,),),),

              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: name2,
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),),),
                  labelText: 'Provisional',
                ),
              ),

              const SizedBox(
                height: 8, ),
              TextField(
                controller: name2,
                decoration: const InputDecoration( contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),),),
                    labelText: 'Complete'
                ),
              ),

              const SizedBox(
                height: 15, ),

              Align(alignment: Alignment.topLeft,
                child:
                Text(" To be submitted in documnet form",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19,),),),

              const SizedBox(
                height: 8,
              ),
              Align(alignment: Alignment.topLeft,
                child:
                Text("1.Description",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,),),),

              const SizedBox(
                height: 4,
              ),
              Align(alignment: Alignment.topLeft,
                child:
                Text("(Description shall start from next page.)",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,),),),

              const SizedBox(
                height: 8,
              ),

              Align(alignment: Alignment.topLeft,
                child:
                Text("2.Claims",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,),),),

              const SizedBox(
                height: 4,
              ),
              Align(alignment: Alignment.topLeft,
                child:
                Text("""(not applicable for provisional specification. Claims should start with the preamble —"1/we claim" on separate page)""",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,),),),

              const SizedBox(
                height: 8,
              ),
        Align(alignment: Alignment.topLeft,
    child:
        Text("3.Date And Signature",
        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,),),),

    const SizedBox(
    height: 4,
    ),
    Align(alignment: Alignment.topLeft,
    child:
    Text(" (Description shall start from next page.)",
    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,),),),
              Align(alignment: Alignment.topLeft,
                child:
                Text("4.Abstract Of The Invention",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,),),),

              const SizedBox(
                height: 4,
              ),
              Align(alignment: Alignment.topLeft,
                child:
                Text("(to be given at the end of last page of specification)",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,),),),

              const SizedBox(
                height: 16,
              ),
              Align(alignment: Alignment.topLeft,
                child:
                Text("Upload Your Documents Here",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,),),),

              const SizedBox(
                height: 4,
              ),
          Row(
              children: <Widget>[

              Align(  alignment: Alignment.topLeft , child:
              ElevatedButton( onPressed: (){},child: Text("Upload",style: TextStyle(fontSize: 15),),
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: Size(20, 30)),),),
              SizedBox(width: 20,),

                Row(
                  children: <Widget>[
                    Container( width: 52,
                        child: Flexible( child:
                        Column( children: <Widget>[

                          Text('notes',
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
                                      note
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

            ]
           ),
      ]),
      ),

    ],),
    );
  }
}
