PImage forest;
PVector p1, p2;
float speedX1, speedX2;

void setup() {
  size(800, 600, P2D);
  forest = loadImage("forest2.png");
  forest.resize(forest.width * (height / forest.height), height);
  imageMode(CENTER);
  
  p1 = new PVector(width/2, height/2);
  p2 = new PVector(p1.x + 50, p1.y - 50);
  
  speedX1 = 5;
  speedX2 = speedX1 * 0.5;
}

void draw() {
  background(0, 127, 255);
    
  tint(255, 127);
  image(forest, p2.x, p2.y);
  
  noTint();
  image(forest, p1.x, p1.y); // the image drawn last will be in front
  
  p1.x += speedX1;
  p2.x += speedX2;
    
  if (p1.x > width || p1.x < 0) {
    speedX1 *= -1;  
    speedX2 *= -1;
  }
}
