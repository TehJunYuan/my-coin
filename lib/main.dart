/* 
  Author: LEE YI FAN & TEH JUN YUAN
  App name: MyCoin
  App description: MyCoin is a service that helps users get
                   up-to-date information on crypto currency transactions and
                   the latest news about the crypto, web3, etc.
  Last updated: 16 Apr 2023
*/
import 'package:flutter/material.dart';
import '../screens/list.dart';
import '../screens/onboarding.dart';
import '../screens/profile.dart';
import '../screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyCoin',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const OnBoardingScreen(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // current index for screens
  int _currentIndex = 0;
  // store all the screens , work with bottom navigation bar
  final screens = [
    const HomePage(),
    ListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[300],
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey[900],
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}