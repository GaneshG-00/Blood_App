import 'package:bloodlink/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterFirst extends StatelessWidget {
  const RegisterFirst({super.key});

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
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'Username'))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'Create password'))),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: 'Confirm password'))),
                  const SizedBox(
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
                                      borderRadius:
                                          BorderRadius.circular(60)))),
                          child: const Text('     Back     ')),
                      const SizedBox(width: 60),
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
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const Home())));
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