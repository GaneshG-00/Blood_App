library my_project.globals;

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: prefer_typing_uninitialized_variables
var userId;
// ignore: prefer_typing_uninitialized_variables
var docId;
// ignore: prefer_typing_uninitialized_variables
var fullname;
// ignore: prefer_typing_uninitialized_variables
var emailaddress;
// ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
var Bloodgroup;
// ignore: prefer_typing_uninitialized_variables
var address;
final users = FirebaseFirestore.instance.collection('USERS');

void getData(String documentId) {
  FirebaseFirestore.instance.collection('USERS').doc(docId).get().then((doc) {
    if (doc.exists) {
      String name = doc['Name'];
      String email = doc['E-mail Address'];
      String bloodGroup = doc['Blood Group'];

      // Do something with the data
      print('Name: $name');
      print('Email: $email');
      print('Blood Group: $bloodGroup');
      fullname = name;
      emailaddress = email;
      Bloodgroup = bloodGroup;
    } else {
      print('Document does not exist');
    }
  }).catchError((error) => print('Error getting document: $error'));
}
