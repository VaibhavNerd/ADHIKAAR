class IPRModel {
  String uid;
  String id;
  bool status;
  String timeapplied;
  String timewhenlastchanged;
  String update;
  int formno;
  Map<String, dynamic> form1;
  Map<String, dynamic> form2;

  IPRModel(
      {this.uid,
      this.id,
      this.status,
      this.timeapplied,
      this.timewhenlastchanged,
      this.update,
      this.formno});

  // receiving data from server
  factory IPRModel.fromMap(map) {
    return IPRModel(
        uid: map['uid'],
        id: map['id'],
        status: map['status'],
        timeapplied: map['timeapplied'],
        timewhenlastchanged: map['timewhenlastchanged'],
        update: map['update'],
        formno: map['formno']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'id': id,
      'status': status,
      'timeapplied': timeapplied,
      'timewhenlastchanged': timewhenlastchanged,
      'update': update,
      'formno': formno
    };
  }
}
