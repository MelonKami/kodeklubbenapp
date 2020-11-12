import 'package:flutter/material.dart';
import 'package:kodeklubben/chat.dart';
import 'package:web_socket_channel/io.dart';
import 'package:websocket_manager/websocket_manager.dart';

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
              final socket = WebsocketManager('ws://play.norskfivepd.net');
              Navigator.push(
                  ctx,
                  MaterialPageRoute(
                      builder: (ctx) => Chat(
                            manager: socket,
                            title: 'Kodeklubben',
                          )));
            },
          )
        ]));
  }
}
