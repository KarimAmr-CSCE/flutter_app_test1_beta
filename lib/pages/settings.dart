import 'package:flutter/material.dart';
import 'package:flutter_app_test1/FETCH_wdgts.dart';

import '../routesGenerator.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: init_appBar(rootNav_key),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //  color: Colors.white,
            const Text(
              " Notifications",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
              color: Colors.grey[200],
              width: 500.0,
              height: 48.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      " Show Notifications",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SwitchScreen(),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
              color: Colors.grey[200],
              width: 500.0,
              height: 48.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      " Vibrate",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SwitchScreen(),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
              color: Colors.grey[200],
              width: 500.0,
              height: 48.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      " Sound",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SwitchScreen(),
                  ]),
            ),
            const SizedBox(height: 10),
            const Text(
              " Location Services",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
              color: Colors.grey[200],
              width: 500.0,
              height: 48.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      " GPS",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SwitchScreen(),

                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;

//  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
//        textValue = 'Switch Button is ON';
      });
//      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
//        textValue = 'Switch Button is OFF';
      });
//      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 1.5,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.cyan,
            activeTrackColor: Colors.cyan[100],
            inactiveThumbColor: Colors.blueGrey[400],
            inactiveTrackColor: Colors.blueGrey[200],
          )),
//          Text('$textValue', style: TextStyle(fontSize: 20),)
    ]);
  }
}
