class MessageModel {
  String message;
  bool me;
  String timestamp;

  MessageModel({this.message, this.me, this.timestamp});

  // receiving data from server
  factory MessageModel.fromMap(map) {
    return MessageModel(
        message: map['message'], me: map['me'], timestamp: map['timestamp']);
  }

  // // sending data to our server
  // Map<String, dynamic> toMap() {
  //   return {
  //     'uid': uid,
  //     'email': email,
  //     'firstName': firstName,
  //     'secondName': secondName,
  //     'timestamp': timestamp,
  //     'currentiprid': currentiprid
  //   };
  // }
}
