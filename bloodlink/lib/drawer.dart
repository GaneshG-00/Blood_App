import 'package:bloodlink/donors.dart';
import 'package:bloodlink/requests.dart';
import 'package:flutter/material.dart';

import 'account.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var profileName = "Ganesh G";
    return SafeArea(
      child: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 116, 17, 10),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                width: 100,
                height: 100,
                child:
                    Image(image: AssetImage('assets/images/profileImage.png')),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hello,",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "${profileName}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ])),
        ListTile(
          title: Align(
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Profile',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Account())));
          },
        ),
        ListTile(
          title: Align(
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Icon(Icons.discount),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Rewards',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Align(
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Icon(Icons.list),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Donors List',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Donors())));
          },
        ),
        ListTile(
          title: Align(
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Icon(Icons.message),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Requests',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Requests())));
          },
        ),
        ListTile(
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0),
            child: Container(
              height: 1.0,
              width: screenSize.width,
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          title: Align(
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Icon(Icons.settings),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Align(
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Icon(Icons.help),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Help',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Align(
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Icon(Icons.info),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'About Us',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ])),
    );
  }
}
