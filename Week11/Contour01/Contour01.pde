void setup() {
  size(800, 600, FX2D);
  
  captureSetup(0);
  //movieSetup("cat.mp4");   
}


void draw() {  
  background(0);
  
  if (!openCvReady && videoImg != null) {
    openCvSetup(videoImg);
  } else {
    openCvRun(videoImg);
  }
  
  surface.setTitle("" + frameRate);
}
