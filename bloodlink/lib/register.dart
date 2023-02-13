import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterFirst extends StatelessWidget {
  const RegisterFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Register here',
                  style: TextStyle(
                      color: Color.fromARGB(255, 120, 118, 118),
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'Username'))),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'Create password'))),
                SizedBox(height: 15),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'Confirm password'))),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60)))),
                        child: const Text('     Back     ')),
                    SizedBox(width: 60),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const RegisterSecond())));
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60)))),
                        child: const Text('     Next     ')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterSecond extends StatelessWidget {
  const RegisterSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter Your Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 120, 118, 118),
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'Full name'))),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'E-mail Id'))),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'Mobile Number'))),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'State'))),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'District'))),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'Pincode'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
