import 'package:flutter/material.dart';
import 'package:flutter_app_test1/breedAdopt_main.dart';
import 'package:flutter_app_test1/pages/explore.dart';
import 'package:flutter_app_test1/pages/reminder.dart';
import 'package:flutter_app_test1/pages/settings.dart';
import 'package:flutter_app_test1/pages/home.dart';
import 'package:flutter_app_test1/routesGenerator.dart';
import 'package:flutter/cupertino.dart';


int _selectedIndex = 0;

class mainApp extends StatefulWidget {
      const mainApp({Key? key}) : super(key: key);

      @override
      State<mainApp> createState() => _mainAppState();
    }
class _mainAppState extends State<mainApp> {



  final List<Widget> childrenP = [
    HomePage(),
    ReminderPage(),
    MapsPage(),
    BA_root(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: childrenP,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: AppNav_key,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: 'Health'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Connect'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],

      ),
    );
  }
}
