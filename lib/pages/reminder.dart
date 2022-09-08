import 'package:flutter/material.dart';
import 'package:flutter_app_test1/FETCH_wdgts.dart';
import 'package:flutter_app_test1/routesGenerator.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: init_appBar(rootNav_key), // CHANGE KEY!!!!
      body: Column(

        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SfCalendar(
                view: CalendarView.month,
              )
          ),

        ]
      ),
    );
  }
}
