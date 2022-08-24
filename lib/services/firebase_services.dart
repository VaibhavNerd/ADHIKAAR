import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ipr/model/ipr_model.dart';

Future<bool> checkuser(String uid) async {
  QuerySnapshot qsnap = await FirebaseFirestore.instance
      .collection("users")
      .where("uid", isEqualTo: uid)
      .get();
  if (qsnap.docs.length > 0) {
    return true;
  } else {
    return false;
  }
}

Future<Map<String, dynamic>> getformdatafromid(String id) async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  DocumentSnapshot docsnap =
      await FirebaseFirestore.instance.doc("users/$uid/forms/$id").get();
  return docsnap.data();
}

Future<String> createnewformforuser() async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  DocumentSnapshot userdata =
      await FirebaseFirestore.instance.doc("users/$uid").get();
  Map<String, dynamic> user = userdata.data();
  if (user["current_application"] == null) {
    IPRModel application = IPRModel();

    DocumentReference docref =
        await FirebaseFirestore.instance.collection("users/$uid/forms").add({
      'uid': uid,
      'status': "Application not completed",
      'timeapplied': DateTime.now().toString(),
      'timewhenlastchanged': DateTime.now().toString(),
      'update': "Form filling started",
      'formno': 1,
      'formsdone': []
    });

    FirebaseFirestore.instance
        .doc("users/$uid")
        .set({"current_application": docref.id}, SetOptions(merge: true));
    return docref.id;
  } else {
    return user["current_application"];
  }
}
