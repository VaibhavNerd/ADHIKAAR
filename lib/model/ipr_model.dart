class IPRModel {
  String uid;
  String id;
  bool status;
  String timeapplied;
  String timewhenlastchanged;
  String update;

  IPRModel(
      {this.uid,
      this.id,
      this.status,
      this.timeapplied,
      this.timewhenlastchanged,
      this.update});

  // receiving data from server
  factory IPRModel.fromMap(map) {
    return IPRModel(
        uid: map['uid'],
        id: map['id'],
        status: map['status'],
        timeapplied: map['timeapplied'],
        timewhenlastchanged: map['timewhenlastchanged'],
        update: map['update']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
    };
  }
}
