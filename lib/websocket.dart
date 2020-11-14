import 'package:websocket_manager/websocket_manager.dart';

class WebsocketInstance {
  static WebsocketManager manager =
      WebsocketManager('ws://play.norskfivepd.net');
  WebsocketInstance() {
    manager.connect();
  }
}
