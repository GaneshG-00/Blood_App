import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'login.dart';

class login_1 extends StatefulWidget {
  const login_1({super.key});

  @override
  State<login_1> createState() => _login_1State();
}

class _login_1State extends State<login_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.center,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              
              children: const [
                Text(
                  'Login Account',
                  style: TextStyle(color: Color(0xff1c6758), fontSize: 30),
                ),
                Text(
                  'Hello! Welcome back to your account',
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 8, 8), fontSize: 15),
                ),
                SizedBox(
                  height: 75,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: 390,
                height: 56,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xffC3E5DF),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                      child: const Text('Phone Number'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 44,
                        width: 172,
                        child: TextButton(
                          onPressed: () {
                            // Navigator.push(context,(MaterialPageRoute(builder: (context) => login_2())),);
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black),
                          child: const Text('Email'),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                child: Row(
                  children: const [
                    // Smaller TextField
                    SizedBox(
                      width: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.alternate_email_rounded)),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email Id',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                height: 57,
                width: 356,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1c6758),
                      foregroundColor: Colors.white),
                  child: const Text('Request OTP'),
                )),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Not Registered Yet?',
                    style: TextStyle(color: Color.fromARGB(255, 120, 118, 118)),
                  ),
                  Text(' Create an account'),
                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
