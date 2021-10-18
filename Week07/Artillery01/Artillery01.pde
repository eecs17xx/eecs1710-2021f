float gravity = 0.4;
float gravityDelta = 0.01;
float friction = 0.99;
float floor;

Cannon cannon;

void setup() {
  size(800, 600, P2D);
  floor = height;
  
  cannon = new Cannon(width/2, height - 100);
}

void draw() {
  background(127);
    
  cannon.run();
  
  println("Number of bullets: " + cannon.bullets.size());
}
