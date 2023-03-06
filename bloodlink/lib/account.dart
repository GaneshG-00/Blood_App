import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'global.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('USERS').doc(docId);
  TextEditingController profilenamecontroller =
      TextEditingController(text: '$fullname');
  TextEditingController profileemailcontroller =
      TextEditingController(text: '$emailaddress');
  TextEditingController profilebloodcontroller =
      TextEditingController(text: '$Bloodgroup');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 116, 17, 10),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => const Home())));
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            )),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_rounded,
              size: 20,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 150,
              height: 150,
              child: Image(image: AssetImage('assets/images/profileImage.png')),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "$fullname",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "$emailaddress",
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: profilenamecontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 120, 118, 118),
                        size: 20,
                      )),
                  style: const TextStyle(height: 1),
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: profileemailcontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(50)
                          ),
                      labelText: 'E-mail Address',
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color.fromARGB(255, 120, 118, 118),
                        size: 20,
                      )),
                  style: const TextStyle(height: 1),
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: profilebloodcontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(50)
                          ),
                      labelText: 'Blood Group',
                      prefixIcon: Icon(
                        Icons.water_drop,
                        color: Color.fromARGB(255, 120, 118, 118),
                        size: 20,
                      )),
                  style: const TextStyle(height: 1),
                )),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    docRef.update({
                      "Name": profilenamecontroller.text,
                      "E-mail Address": profileemailcontroller.text,
                      "Blood Group": profilebloodcontroller.text,
                    });
                    getData(docId);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 120, 118, 118),
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      )),
    ));
  }
}
