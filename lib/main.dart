import 'websocket.dart';
import 'package:flutter/material.dart';
import 'package:kodeklubben/loadingscreen.dart';

void main() {
  runApp(MyApp());
  WebsocketInstance();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(home: LoadingScreen());
  }
}
