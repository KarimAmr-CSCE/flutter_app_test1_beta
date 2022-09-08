import 'package:flutter/material.dart';
import 'package:flutter_app_test1/routesGenerator.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 8,
            shadowColor: Colors.cyanAccent[70],
            title: Text(
              "FETCH",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            leadingWidth: 0,
            backgroundColor: Colors.white70,
            actions: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  AppNav_key.currentState?.pushNamed('/Settings');
                  setState(() {

                  });
                },
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.cyan,
                  size: 35,
                ),
              ),
            ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 410, child: Calendar()),
                const Text(
                  '    ARTICLES',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.notes),
                        onPressed: () {},
                        iconSize: 50,
                        splashColor: Colors.cyan,
                      ),
                      IconButton(
                        icon: const Icon(Icons.notes),
                        onPressed: () {},
                        iconSize: 50,
                        splashColor: Colors.cyan,
                      ),
                      IconButton(
                        icon: const Icon(Icons.notes),
                        onPressed: () {},
                        iconSize: 50,
                        splashColor: Colors.cyan,
                      ),
                    ]),
              ]),
        ),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // create calendar
      TableCalendar(
        calendarController: _calendarController,
      ),
    );
  }
}
