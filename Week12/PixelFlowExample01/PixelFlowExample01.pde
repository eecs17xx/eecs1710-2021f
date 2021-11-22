PImage img;
boolean toggleBloom = true;

void setup() {
  size(800, 600, P2D);
  bloomSetup();
  
  img = loadImage("alien.jpg");
}

void draw() {
  background(0);
  
  tex.beginDraw();
  tex.background(0);
  tex.image(img, 0, 0);
  tex.endDraw();
  
  if (toggleBloom) {
    bloomDraw();
  } else {
    image(img, 0, 0);
  }
}
