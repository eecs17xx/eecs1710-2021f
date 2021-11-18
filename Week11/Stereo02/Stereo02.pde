void setup() {
  size(640, 480, FX2D);

  setupCapture(0, 2);
  setupDenseOpticalFlow();
}

void draw() { 
  updateDenseOpticalFlow();
  
  image(imgL, 0, 0);
  image(imgR, imgL.width, 0);

  image(depth, imgL.width/2, imgL.height);
  
  surface.setTitle("" + frameRate);
}
