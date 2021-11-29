//1.  This function initializes OSC.  Put it in your setup().
void oscSetup() {
  oscP5 = new OscP5(this, receivePort);  // start osc
  myRemoteLocation = new NetAddress(ipNumber, sendPort);
}

//2.  This function receives OSC.  It runs automatically; no need to call it in your code.
void oscEvent(OscMessage myMessage) {
  println(myMessage);
  if(myMessage.checkAddrPattern("/" + channel)) {
    if(myMessage.checkTypetag("f")) {  // types are i = int, f = float, s = String, ifs = all
      oscReceiveData = myMessage.get(0).floatValue();  // commands are intValue, floatValue, stringValue
    }  
  }
}

//3.  This function sends OSC.  Put it in your draw(), or in control functions like mousePressed() and keyPressed().
void oscSend(){
  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData);
  oscP5.send(myMessage, myRemoteLocation);
}
