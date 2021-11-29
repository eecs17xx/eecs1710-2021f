//1.  This function initializes OSC.  Put it in your setup().
void oscSetup() {
  oscP5 = new OscP5(this,receivePort);  // start osc
  myRemoteLocation = new NetAddress(ipNumber,sendPort);
}

//2.  This function receives OSC.  It runs automatically; no need to call it in your code.
void oscEvent(OscMessage myMessage) {
  println(myMessage);
  for(int i=0;i<oscChannelNames.length;i++){
    if(myMessage.checkAddrPattern("/" + oscChannelNames[i])) {
      if(myMessage.checkTypetag("f")) {  // types are i = int, f = float, s = String, ifs = all
        oscReceiveData[i] = myMessage.get(0).floatValue();  // commands are intValue, floatValue, stringValue
      }  
    }
  }
}

//3.  This function sends OSC.  Put it in your draw(), or in control functions like mousePressed() and keyPressed().
void oscSend(){
    //--
  if(sendOsc){
    OscMessage myMessage;
  
  for(int i=0;i<oscSendData.length;i++){
    myMessage = new OscMessage("/" + oscChannelNames[i]);
    myMessage.add(oscSendData[i]);
    oscP5.send(myMessage, myRemoteLocation);
  }
  }
}

//4.  This function uses incoming OSC data in your sketch by assigning it to variables.
void oscUse(){
println("posX: " + oscReceiveData[0] + "   posY: " + oscReceiveData[1] + "   posZ: " + oscReceiveData[2]);
}
