import 'package:bloodlink/home.dart';
import 'package:bloodlink/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();
  var errormessage = "";
  bool _isvisible = false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 17, 10),
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.89,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 20, right: 20, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/loginicon.png',
                      height: MediaQuery.of(context).size.width * 0.50,
                      width: MediaQuery.of(context).size.width * 0.50,
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
                    const SizedBox(height: 10),
                    Visibility(
                      visible: _isvisible,
                      child: Text(
                        errormessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                          controller: _emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'E-mail Address',
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: Color.fromARGB(255, 120, 118, 118),
                                size: 20,
                              )),
                          style: const TextStyle(height: 1),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _password,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 120, 118, 118),
                              size: 20,
                            ),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color:
                                      const Color.fromARGB(255, 120, 118, 118),
                                ))),
                        style: const TextStyle(height: 1),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailAddress.text,
                                password: _password.text)
                            .then((value) {
                          print('SignIn successfull');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Home())));
                        }).onError((error, stackTrace) {
                          print("Error:${error.toString()}");
                          setState(() {
                            _isvisible = true;
                          });
                          Future.delayed(const Duration(milliseconds: 400), () {
                            setState(() {
                              _isvisible = false;
                            });
                          });
                          errormessage = "E-mail or password Doesn't match";
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 116, 17, 10)),
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size(MediaQuery.of(context).size.width * 0.75, 50)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text("Doesn't have an account"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
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
      ),
    );
  }
}
