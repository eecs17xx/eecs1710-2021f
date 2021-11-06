/*
https://florianschulz.info/stt/
Simple WebSocketServer example that can receive voice transcripts from Chrome
Requires WebSockets Library: https://github.com/alexandrainst/processing_websttSockets
*/

import websockets.*;

WebsocketServer sttSocket;
String sttMessage = "";

void setupSttReceiver() {
  sttSocket = new WebsocketServer(this, 1337, "/p5websocket");
}

void setupSttReceiver(int _port, String _channel) {
  sttSocket = new WebsocketServer(this, _port, _channel);
}

void webSocketServerEvent(String msg) {
  sttMessage = msg;
  println(msg);
}
