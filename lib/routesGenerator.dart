import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_app_test1/pages/breed.dart';
import 'package:flutter_app_test1/pages/breed_sp.dart';
import 'package:flutter_app_test1/pages/petRegistration.dart';


// This is for routes configurations across the whole application

// Global keys identify each Navigator key for individual tabs in application
 GlobalKey<NavigatorState> BA_key = GlobalKey();
GlobalKey<NavigatorState> rootNav_key = GlobalKey();
GlobalKey<NavigatorState> AppNav_key = GlobalKey();


// This is the Breed/Adopt routesGenerator
class BA_RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    //for each case called, checks are applied to navigation to the correct next page
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => addBreedPage());
      case '/pet_register':
        //this case is for second step of pet verification after taking a picture of the pet
        // if happens to navigate to the page with an unidentified photo will navigate to error route
        if (args is File) {
          return MaterialPageRoute(
            builder: (_) => petRegPage(recFile: args), // Second Page
          );
        }
        return _errorRoute();
      default:
        // if an unmatched route is called, return error route
        return _errorRoute();
    }
  }

  // this is an error page that appears once any error happens in navigation above
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
