class UserModel {
  String uid;
  String email;
  String firstName;
  String secondName;
  String timestamp;
  String currentiprid;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.timestamp,
      this.currentiprid});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        secondName: map['secondName'],
        timestamp: map['timestamp'],
        currentiprid: map['currentiprid']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'timestamp': timestamp,
      'currentiprid': currentiprid
    };
  }
}
