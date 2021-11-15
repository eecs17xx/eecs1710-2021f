
void setup() {
  size(800, 600, P2D);
  
  opencvSetup();
}


void draw() { 
  opencvUpdate();
  
  image(videoImg, 0, 0);

  opencvDraw();
  
  surface.setTitle("" + frameRate);
}
