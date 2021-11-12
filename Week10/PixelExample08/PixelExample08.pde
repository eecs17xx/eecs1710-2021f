import peasy.*;

PShape ps;
PImage img, depthImg, rgbImg;
PeasyCam cam;
int scaler = 1;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 400);
  ps = createShape();

  img = loadImage("hallway.png");
  depthImg = img.get(0, 120, 640, 480);
  rgbImg = img.get(640, 120, 1280, 480);
  depthImg.loadPixels();
  rgbImg.loadPixels();
  
  ps.beginShape(POINTS);
  ps.strokeWeight(2 * scaler);
  for (int x=0; x<depthImg.width; x+=scaler) {
    for (int y=0; y<depthImg.height; y+=scaler) {
      // find a 2D x, y coordinate in the 1D pixel array
      int loc = x + y * depthImg.width;
      
      float z = brightness(depthImg.pixels[loc]) * 8; // "magic number" so the depth looks approximately correct
      ps.stroke(rgbImg.pixels[loc]);
      ps.vertex(x, y, z);
    } 
  } 
  ps.endShape();
}

void draw() {
  background(0);
  
  shape(ps, -width/2, -height/2);
  
  surface.setTitle("" + frameRate);
}
