import 'package:flutter/material.dart';
import 'package:careconnect/customer/HomePage/ccBooking.dart';
import 'package:careconnect/customer/HomePage/chat.dart';
import 'package:careconnect/customer/HomePage/profile.dart';
import 'package:careconnect/customer/HomePage/homePage.dart';

class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Demo',
      home: BottomNavExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 0;

  // Define the pages to show
  
  final List<Widget> _pages = [
  Homepage(),
  Ccbooking(),
  Chat(),
  CustomerProfilePage(), 
];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Book'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
