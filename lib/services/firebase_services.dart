import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
