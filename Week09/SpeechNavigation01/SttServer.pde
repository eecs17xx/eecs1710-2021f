import websockets.*;

// https://florianschulz.info/stt/

WebsocketServer sttSocket;
String result = "";

void setupSttReceiver() {
  sttSocket = new WebsocketServer(this, 1337, "/p5websocket");
}

void setupSttReceiver(int _port, String _channel) {
  sttSocket = new WebsocketServer(this, _port, _channel);
}

void webSocketServerEvent(String msg) {
  result = msg.toLowerCase();
  println(result);
}
