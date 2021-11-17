void setup() {
  size(640, 480, FX2D);
  
  //captureSetup(0);
  movieSetup("cat.mp4");   
}

void draw() {  
  background(0);
  
  if (videoImg != null) {
    if (openCv == null) {
      openCvSetup(videoImg);
    } else {
      openCvUpdate(videoImg);
    }

    image(openCv.getSnapshot(), 0, 0);
  } 
  
  surface.setTitle("" + frameRate);
}
