import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_app_test1/pages/breed.dart';
import 'package:flutter_app_test1/pages/breed_sp.dart';
import 'package:flutter_app_test1/pages/petRegistration.dart';

 GlobalKey<NavigatorState> BA_key = GlobalKey();
GlobalKey<NavigatorState> rootNav_key = GlobalKey();
GlobalKey<NavigatorState> AppNav_key = GlobalKey();


class BA_RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => addBreedPage());
      case '/pet_register':
        // Validation of correct data type
        if (args is File) {
          return MaterialPageRoute(
            builder: (_) => petRegPage(recFile: args), // Second Page
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ), // AppBar
        body: Center(
          child: Text('ERROR'),
        ), // Center
      ); // Scaffold
    }); // Material PageRoute
  }
}
