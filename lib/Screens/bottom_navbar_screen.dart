import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foeto_care/Screens/foetus_screen.dart';
import 'mother_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _index = 0;
  final screens = [
    MotherScreen(),
    FoetusScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: screenSize.height*0.07,
          child: BottomNavigationBar(
            //backgroundColor: Color(0xff101110),
            backgroundColor: Colors.pinkAccent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
               BottomNavigationBarItem(
                backgroundColor: Color(0xff1c1d21),
                icon:  Icon(Icons.pregnant_woman),
                label: 'Mother',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color(0xff1c1d21),
                icon: Icon(Icons.child_care),
                label: 'Foetus',
              ),
            ],
            currentIndex: _index,
            selectedItemColor: Colors.white,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
        ),
        body: screens[_index]);
  }
}
