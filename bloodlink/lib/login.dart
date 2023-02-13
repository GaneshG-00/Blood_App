import 'package:bloodlink/register.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 116, 17, 10),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 50),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo1.jpg',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                        color: Color.fromARGB(255, 120, 118, 118),
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'Username'),
                        style: TextStyle(height: 1),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Password',
                      ),
                      style: TextStyle(height: 1),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)))),
                      child: const Text('  Login  ')),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text("doesn't have an account"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const RegisterFirst())));
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                              color: Color.fromARGB(255, 103, 175, 234)),
                        )),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
