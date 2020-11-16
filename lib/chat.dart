import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kodeklubben/websocket.dart';

class Chat extends StatefulWidget {
  // Future<void> receiveMessages() {
  //   print('fetchingMessages');
  //   return Future.delayed(Duration(seconds: 5), () {
  //     WebsocketInstance.manager.send(
  //       jsonEncode({'event': 'fetchMessages'}),
  //     );
  //   });
  // }

  // Chat() {
  //   receiveMessages();
  // }
  @override
  State<StatefulWidget> createState() => ChatState();
}

class ChatState extends State<Chat> {
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = new ScrollController();

  bool isUserLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  // Future isUserLoggedIn() {
  //   FirebaseAuth.instance.currentUser().then(
  //     (firebaseUser) {
  //       print(firebaseUser);
  //       if (firebaseUser == null) {
  //         return false;
  //         //print('Returning False');
  //         //return false;
  //       } else {
  //         return true;
  //         //print('Returning True');
  //         //return true;
  //       }
  //     },
  //   );
  // }

  Future<void> receiveMessages() {
    print('fetchingMessages');
    return Future.delayed(Duration(seconds: 2), () {
      WebsocketInstance.manager.send(
        jsonEncode({'event': 'fetchMessages'}),
      );
    });
  }

  ChatState() {
    receiveMessages();
  }

  final List<Widget> messages = new List<Widget>();

  void onMessage(dynamic message) {
    print(message);
    if (message == 'True') {
    } else if (message == '/clearChat') {
      setState(() {
        messages.clear();
      });
    } else {
      setState(() {
        messages.add(
          Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                '$message',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
        );
      });
    }
  }

  void onClose(dynamic _) {
    setState(() {
      messages.add(Text('Koblet fra server'));
    });
  }

  @override
  Widget build(BuildContext context) {
    print('building widget chat');
    WebsocketInstance.manager.onClose(this.onClose);
    WebsocketInstance.manager.onMessage(this.onMessage);

    // Timer(Duration(seconds: 1), () {
    //   _scrollController.animateTo(
    //     _scrollController.position.maxScrollExtent,
    //     curve: Curves.easeOut,
    //     duration: const Duration(milliseconds: 300),
    //   );
    // });
    print('return $isUserLoggedIn()');
    if (!isUserLoggedIn()) {
      print('Running as logged out');
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Column(children: messages)],
          ),
        ),
      );
    } else {
      print('Running as logged in');
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: 'Send en melding til felles chatten'),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    _clearChat();
                  },
                  child: Text('Clear Chat - Midlertidig funksjon')),
              Flexible(
                  child: Column(
                children: messages,
              )
                  // ListView(controller: _scrollController, children: messages),
                  ),
              // Implement this - SingleChildScrollView
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _sendMessage,
          tooltip: 'Trykk her for å sende melding til felles chat',
          child: Icon(Icons.send),
        ),
      );
    }
  }

  void _clearChat() {
    print('clearing list');
    setState(() {
      messages.clear();
      WebsocketInstance.manager
          .send(jsonEncode({'event': 'clearChatMessages'}));
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      print('Sending message');
      print(_controller.text);
      WebsocketInstance.manager.send(jsonEncode(
        {
          'event': 'SendChatMessage',
          'data': {'msg': _controller.text, 'author': 'MelonKami'}
        },
      ));
    }
  }

  // @override
  // void dispose() {
  //   widget.manager.close();
  //   super.dispose();
  // }
}
