import 'package:bloodlink/account.dart';
import 'package:bloodlink/donors.dart';
import 'package:bloodlink/requests.dart';
import 'package:bloodlink/urgent.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;
  static final List<Widget> _widgetOptions = <Widget>[
    Donors(),
    Urgent(),
    Requests(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 116, 17, 10),
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text(
            'BLOODLINK',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const Account())));
              },
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_location_alt_outlined), label: 'Map'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  size: 33,
                ),
                label: 'Urgent Request'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: 'Requests'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 116, 17, 10),
          onTap: _onItemTapped,
        ));
  }
}
