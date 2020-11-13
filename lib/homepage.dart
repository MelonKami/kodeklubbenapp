import 'package:flutter/material.dart';
import 'package:kodeklubben/chat.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(title: Text('Kodeklubben!')),
        body: Column(children: [
          FlatButton(
            child: Text(
              'Chat',
            ),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                  ctx,
                  MaterialPageRoute(
                      builder: (ctx) => Chat(
                            title: 'Kodeklubben',
                          )));
            },
          )
        ]));
  }
}
