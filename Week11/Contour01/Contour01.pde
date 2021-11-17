void setup() {
  size(640, 480, FX2D);
  
  captureSetup(0);
  // movieSetup("cat.mp4");   
}

void draw() {  
  background(0);
  scale(2.0);
  
  if (videoImg != null) {
    if (openCv == null) {
      openCvSetup(videoImg);
    } else {
      openCvUpdate(videoImg);
      image(videoImg, 0, 0);
    }
  }
  
  if (ps != null) {
    shape(ps);
  }
  surface.setTitle("" + frameRate);
}
