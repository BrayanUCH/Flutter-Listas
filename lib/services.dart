import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:listas/student.dart';
import 'package:provider/provider.dart';
class studenteService {
  CollectionReference studentRef =
  FirebaseFirestore.instance.collection("students");

    Future<List<student>> get() async {
    QuerySnapshot querySnapshot = await studentRef.get();
    return querySnapshot.docs
        .map((ds) => student.fromSnapshot(ds.id, ds.data()))
        .toList();
  }
}
