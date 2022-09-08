import 'package:flutter/material.dart';
import 'package:flutter_app_test1/pages/login.dart';
import 'package:flutter_app_test1/pages/signup.dart';
import 'package:flutter_app_test1/mainApp.dart';
import 'package:flutter_app_test1/pages/settings.dart';
import 'package:flutter_app_test1/pages/petRegistration.dart';
import 'package:flutter_app_test1/routesGenerator.dart';


void main() {
  runApp( MaterialApp(
    navigatorKey: rootNav_key,
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/signup': (context) => Signup(),
      '/mainApp': (context) => mainApp(),
      // '/sett': (context) => SettingsPage(),
    }
  ));
  
}



