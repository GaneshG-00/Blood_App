import 'package:bloodlink/home.dart';
import 'package:bloodlink/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterFirst extends StatefulWidget {
  const RegisterFirst({super.key});

  @override
  State<RegisterFirst> createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
  TextEditingController _emailAddress = TextEditingController();
  TextEditingController _password1 = TextEditingController();
  TextEditingController _password2 = TextEditingController();
  var errormessage = "";
  bool _isvisible = false;
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Register here',
                    style: TextStyle(
                        color: Color.fromARGB(255, 120, 118, 118),
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: _isvisible,
                    child: Text(
                      '$errormessage',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                              )))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          controller: _password1,
                          obscureText: !_passwordVisible1,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'Create password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 120, 118, 118),
                                size: 20,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible1 = !_passwordVisible1;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible1
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color.fromARGB(
                                        255, 120, 118, 118),
                                  ))))),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          controller: _password2,
                          obscureText: !_passwordVisible2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'Confirm password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 120, 118, 118),
                                size: 20,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible2 = !_passwordVisible2;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color.fromARGB(
                                        255, 120, 118, 118),
                                  ))))),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const Login())));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 116, 17, 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(60)))),
                          child: const Text('     Back     ')),
                      const SizedBox(width: 60),
                      ElevatedButton(
                          onPressed: () {
                            if (_password1.text == _password2.text) {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _emailAddress.text,
                                      password: _password2.text)
                                  .then((value) {
                                print("SignUp Successfull");
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const RegisterSecond())));
                              }).onError((error, stackTrace) {
                                print("Error SignUp:${error.toString()}");
                              });
                            } else if (_password1.text != _password2.text) {
                              setState(() {
                                _isvisible = true;
                              });
                              Future.delayed(const Duration(milliseconds: 400),
                                  () {
                                setState(() {
                                  _isvisible = false;
                                });
                              });
                              errormessage = "Passwords Doesn't Match";
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 116, 17, 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(60)))),
                          child: const Text('     Next     ')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterSecond extends StatefulWidget {
  const RegisterSecond({super.key});

  @override
  State<RegisterSecond> createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond> {
  TextEditingController dateinput = TextEditingController();
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  var _dropdownValue;
  void dropdownCallback(selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Enter Your Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 120, 118, 118),
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'Full name'))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: dateinput,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'Date of Birth',
                            suffixIcon: Icon(Icons.calendar_month)),
                        onTap: () async {
                          DateTime? _dateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1958),
                              lastDate: DateTime(2024));
                          if (_dateTime != null) {
                            print(_dateTime);
                            dateinput.text =
                                DateFormat('dd-MM-yyyy').format(_dateTime);
                          }
                        },
                        readOnly: true,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'Mobile Number'))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: const Color.fromARGB(255, 152, 148, 148),
                              width: 1)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          iconSize: 36,
                          items: const [
                            DropdownMenuItem(
                              value: null,
                              child: Text(
                                'Please select Your Blood Group',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 112, 107, 107)),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "A+",
                              child: Text('A+',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 112, 107, 107))),
                            ),
                            DropdownMenuItem(
                              value: "A-",
                              child: Text('A-',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 112, 107, 107))),
                            ),
                            DropdownMenuItem(
                              value: "B+",
                              child: Text('B+',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 112, 107, 107))),
                            ),
                            DropdownMenuItem(
                              value: "B-",
                              child: Text('B-',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 112, 107, 107))),
                            ),
                            DropdownMenuItem(
                              value: "O+",
                              child: Text('O+',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 112, 107, 107))),
                            ),
                            DropdownMenuItem(
                              value: "O-",
                              child: Text('O-',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 112, 107, 107))),
                            ),
                            DropdownMenuItem(
                              value: "AB+",
                              child: Text('AB+',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 112, 107, 107))),
                            ),
                            DropdownMenuItem(
                              value: "AB-",
                              child: Text('AB-',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 112, 107, 107))),
                            ),
                          ],
                          value: _dropdownValue,
                          onChanged: dropdownCallback,
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'State'))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'District'))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'Pincode'))),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Home())));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 116, 17, 10)),
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(MediaQuery.of(context).size.width * 0.75, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
