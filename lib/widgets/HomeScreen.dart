import 'package:flutter/material.dart';

import 'AccountScreen.dart';
import 'MoreScreen.dart';
import 'OrdersScreen.dart';
import 'ServiceScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> list = [ServiceScreen(),OrdersScreen(),AccountScreen(),MoreScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/logo.png",
              height: 25,
              width: 25,
            ),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff6FC8FB),
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
