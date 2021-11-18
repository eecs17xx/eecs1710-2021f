import processing.video.*;

Capture capture;
int videoWidth = 320;
int videoHeight = 240;
int videoFps = 30;
PGraphics buffer;

void setupCapture(int whichCamera) {
  String[] cameraNames = capture.list();
  for (String cameraName : cameraNames) {
    println(cameraName);
  }
  capture = new Capture(this, videoWidth, videoHeight, cameraNames[whichCamera], videoFps);    
  buffer = createGraphics(videoWidth, videoHeight, P3D);
  
  capture.start();
}

void captureEvent(Capture c) {
  c.read();
  
  armUpdateOpenCV = true;
}
