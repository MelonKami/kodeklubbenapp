import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kodeklubben/websocket.dart';
import 'homepage.dart';

class LoadingScreen extends StatefulWidget {
  final int version = 11;

  LoadingScreen() {
    print('Starting connection Loadingscreen');
    WebsocketInstance.manager.onClose((dynamic) => print('Closed connoection'));
    WebsocketInstance.manager
        .send(jsonEncode({'event': 'checkVersion', 'data': version}));
  }

  @override
  State<StatefulWidget> createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  bool launch = false;

  void onClose(dynamic _) {
    setState(() {
      print('Closing connection Loadingscreen');
    });
  }

  Future<void> loadingsleep() {
    return Future.delayed(Duration(seconds: 5), () {
      setState(() {
        launch = true;
      });
    });
  }

  void onMessage(dynamic message) {
    print(message);
    if (message == 'True') {
      setState(() {
        launch = true;
      });
      //loadingsleep();
    } else {
      setState(
        () {
          launch = false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext ctx) {
    WebsocketInstance.manager.onClose(this.onClose);
    WebsocketInstance.manager.onMessage(this.onMessage);
    //WebsocketInstance var originalt Widget.manager (Dersom det skulle komme noen problemer)
    if (launch) {
      //--||--
      return Scaffold(
        appBar: AppBar(
          title: Text('Kodeklubben'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.grey[800],
        body: Center(
          child: FlatButton(
              child: Text('Logg Inn'),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  ctx,
                  MaterialPageRoute(builder: (ctx) => HomePage()),
                );
              }),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Laster inn (Det kan hende at serveren er nede eller at din app versjon er for gammel)',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              Image.asset('assets/kidsakoder.png'),
              Image.asset('assets/loading.gif')
            ],
          ),
        ),
      );
    }
  }
}
