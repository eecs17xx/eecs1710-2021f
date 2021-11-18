void setup() {
  size(640, 480, FX2D);
  
  setupOpenCV();
  setupCapture(0, 2);
}

void draw() { 
  image(imgL, 0, 0);
  image(imgR, imgL.width, 0);
  
  updateOpenCV();
  
  image(depth, imgL.width/2, imgL.height);
  
  surface.setTitle("" + frameRate);
}
