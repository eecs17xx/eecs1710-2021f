PImage img;

void setup() {
  size(800, 600, P2D);
  
  img = loadImage("alien.jpg");
  
  setupShaders();
}

void draw() {
  background(0);
  
  runShaders();
}
