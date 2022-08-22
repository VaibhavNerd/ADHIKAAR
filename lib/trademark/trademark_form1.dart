import 'package:flutter/material.dart';
import 'package:ipr/strings/tm_form1.dart';
class TmForm1 extends StatefulWidget {
   TmForm1({Key key}) : super(key: key);

  @override
  State<TmForm1> createState() => _TmForm1State();
}
TextEditingController name_tm1_1 = TextEditingController();
TextEditingController trading_tm = TextEditingController();
TextEditingController address_tm1_1 = TextEditingController();
TextEditingController state_tm1_1 = TextEditingController();
TextEditingController country_tm1_1 = TextEditingController();
TextEditingController address_service_tm1 = TextEditingController();
TextEditingController state_tm1_2 = TextEditingController();
TextEditingController country_tm1_2 = TextEditingController();
TextEditingController mobile_tm1_1 = TextEditingController();
TextEditingController email_tm1_1 = TextEditingController();
TextEditingController appl_tm1_1 = TextEditingController();
  TextEditingController name_tm1_2 = TextEditingController();
TextEditingController address_tm1_2 = TextEditingController();
TextEditingController agent_nature = TextEditingController();
TextEditingController regis_no = TextEditingController();
TextEditingController name_tm1_3 = TextEditingController();
TextEditingController authority_tm = TextEditingController();
TextEditingController doc_dteils_tm = TextEditingController();

class _TmForm1State extends State<TmForm1> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Form'),
      ),
      body: ListView ( children :[
        Padding(padding: EdgeInsets.all(20),
          child:
          Column( children:[SizedBox(
            height: 8,
          ),
            Align(alignment: Alignment.topLeft,
              child:
              Text("Applicant",
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,),),),
            SizedBox(
              height: 8,
            ),
            textForm("Name", name_tm1_1),
            SizedBox(height: 10,),
            textForm("Trading as", trading_tm),
            SizedBox(height: 10,),
            textForm("Address", address_tm1_1),
             SizedBox(height: 10,),
            textForm("State", state_tm1_1),
            SizedBox(height: 10,),
            textForm("Country", country_tm1_1),
            SizedBox(height: 10,),
            textForm("Country", country_tm1_1),
            SizedBox(height: 10,),
          Column ( mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end,
              children: [
          Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(address_service)),
                ],
              )),
           Container(  width: 10, child:  alert(context, "", add_service),),
            ]),

            const SizedBox(
              height: 8,
            ),
            textForm("Address for service", address_service_tm1),
            SizedBox(height: 10,),
            // Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //   textForm("State", state_tm1_2),
            //   textForm("Country", country_tm1_2),
            //
            // ],)
            textForm("State", state_tm1_2),
             SizedBox(height: 10,),
             textForm("Country", country_tm1_2),


    ],)
          ,)
        ,])
      ,);
  }
}
 Widget textForm( String labelHint,TextEditingController textEditingController){
  return
    TextFormField(
      controller: textEditingController,
      validator: (value) {
    if (value.isEmpty) {
      return ("Value is empty");
    }
    return null;
      },
      decoration:  InputDecoration( contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder( borderRadius: const BorderRadius.all(
          Radius.circular(8.0),),),
        labelText: labelHint,
      ),
    );
}

Widget alert (BuildContext context, String alertTiltle , String alertMessage ,){
  return
  GestureDetector(onTap: (){

    showDialog(context: context, builder:(context){
      return
        Container(
          child: AlertDialog(
            title: Text(alertTiltle,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
            actions: [TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("OK"))],
            content: Container(
              child: SingleChildScrollView(
                child: Text(
                    alertMessage
                ),
              ),
            ),
          ),

        );
    } );

  }, child:
  Icon(Icons.info_outline_rounded, color: Colors.blueAccent,size: 18,),
  );
}

