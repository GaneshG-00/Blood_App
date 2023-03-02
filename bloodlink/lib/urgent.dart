import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Urgent extends StatefulWidget {
  const Urgent({super.key});

  @override
  State<Urgent> createState() => _UrgentState();
}

class _UrgentState extends State<Urgent> {
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
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 116, 17, 10),
              height: 50,
              width: screenSize.width,
              child: Center(
                child: Text(
                  "Enter the Details",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Patient Name',
                  ),
                  style: TextStyle(height: 1),
                )),
            const SizedBox(
              height: 10,
            ),
            const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact Number',
                  ),
                  style: TextStyle(height: 1),
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
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
                          'Blood Group',
                          style: TextStyle(
                              color: Color.fromARGB(255, 112, 107, 107)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "A+",
                        child: Text('A+',
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 107, 107))),
                      ),
                      DropdownMenuItem(
                        value: "A-",
                        child: Text('A-',
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 107, 107))),
                      ),
                      DropdownMenuItem(
                        value: "B+",
                        child: Text('B+',
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 107, 107))),
                      ),
                      DropdownMenuItem(
                        value: "B-",
                        child: Text('B-',
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 107, 107))),
                      ),
                      DropdownMenuItem(
                        value: "O+",
                        child: Text('O+',
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 107, 107))),
                      ),
                      DropdownMenuItem(
                        value: "O-",
                        child: Text('O-',
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 107, 107))),
                      ),
                      DropdownMenuItem(
                        value: "AB+",
                        child: Text('AB+',
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 107, 107))),
                      ),
                      DropdownMenuItem(
                        value: "AB-",
                        child: Text('AB-',
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 107, 107))),
                      ),
                    ],
                    value: _dropdownValue,
                    onChanged: dropdownCallback,
                    isExpanded: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Medical Centre',
                  ),
                  style: TextStyle(height: 1),
                )),
            SizedBox(
              height: 10,
            ),
            const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Request Date',
                  ),
                  style: TextStyle(height: 1),
                )),
            const SizedBox(
              height: 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Valid Only for 3 days",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 70,
              child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      border: OutlineInputBorder(),
                      hintText: ' Notes (Optional)', hintStyle: TextStyle(),
                    ),
                    style: TextStyle(height: 1),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
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
              child: const Text(
                'Submit Request',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
