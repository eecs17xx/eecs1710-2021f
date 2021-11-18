import processing.video.*;
Capture capture1, capture2;
int videoWidth = 320;
int videoHeight = 240;
int videoFps = 30;
PImage imgL, imgR;
boolean armUpdateL, armUpdateR;

void captureSetup(int whichCamera1, int whichCamera2) {  
  String[] cameraNames = capture1.list();
  for (String cameraName : cameraNames) {
    println(cameraName);
  }
  capture1 = new Capture(this, videoWidth, videoHeight, cameraNames[whichCamera1], videoFps);    
  capture1.start();
  capture2 = new Capture(this, videoWidth, videoHeight, cameraNames[whichCamera2], videoFps);    
  capture2.start(); 
  
  imgL = createImage(videoWidth, videoHeight, RGB);
  imgR = createImage(videoWidth, videoHeight, RGB);
  
  armUpdateL = false;
  armUpdateR = false;
}

void captureEvent(Capture c) {
  c.read();
  if (c == capture1) {
    imgL = c;
    armUpdateL = true;
  } else {
    imgR = c;
    armUpdateR = true;
  }
}
