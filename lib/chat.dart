import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:websocket_manager/websocket_manager.dart';

class Chat extends StatefulWidget {
  final String title;
  final WebsocketManager manager =
      WebsocketManager('ws://play.norskfivepd.net');
  Chat({Key key, @required this.title}) : super(key: key) {
    print(title);
    manager.connect();
  }

  @override
  State<StatefulWidget> createState() => ChatState();
}

class ChatState extends State<Chat> {
  TextEditingController _controller = TextEditingController();

  final List<Widget> messages = new List<Widget>();

  void onMessage(dynamic message) {
    setState(() {
      messages.add(Center(
          child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(6.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text('$message',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24))))); //Text('$message'));
    });
  }

  void onClose(dynamic _) {
    setState(() {
      messages.add(Text('Koblet fra server'));
    });
  }

  @override
  Widget build(BuildContext context) {
    //widget.manager.close();
    widget.manager.onClose(this.onClose);
    widget.manager.onMessage(this.onMessage);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
            Column(children: messages)
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

  void _sendMessage() {
    print('test');
    if (_controller.text.isNotEmpty) {
      widget.manager.send(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.manager.close();
    super.dispose();
  }
}
