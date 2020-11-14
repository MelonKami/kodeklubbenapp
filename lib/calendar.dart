import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'Kodeklubben',
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text('Kalender!'),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Text('Kalender'),
        ),
      ),
    );
  }
}
