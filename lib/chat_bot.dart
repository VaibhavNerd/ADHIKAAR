import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipr/model/message_model.dart';
import 'package:http/http.dart' as http;
import 'components/constants.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<MessageModel> messages = [];
  TextEditingController text = TextEditingController();
  Future<void> getresponse() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://mark12-env.eba-hkqffsrb.us-east-1.elasticbeanstalk.com/get?msg=${text.text}'));
    setState(() {
      text.text = "";
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String message = (await response.stream.bytesToString());
      Map<String, dynamic> map = {
        'message': message,
        'me': false,
        'timestamp': DateTime.now().toString()
      };
      setState(() {
        messages.add(MessageModel.fromMap(map));
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Text('Our Bot'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  150 -
                  MediaQuery.of(context).viewInsets.bottom,
              child: ListView.builder(
                  reverse: true,
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (!messages[messages.length - 1 - index].me
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (!messages[messages.length - 1 - index].me
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            messages[messages.length - 1 - index].message,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: text,
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Map<String, dynamic> map = {
                        'message': text.text,
                        'me': true,
                        'timestamp': DateTime.now().toString()
                      };
                      setState(() {
                        messages.add(MessageModel.fromMap(map));
                      });

                      getresponse();
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
