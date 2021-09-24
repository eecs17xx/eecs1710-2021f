PImage forest;
float x;
float y;
float speedX = 5;

void setup() {
  size(800, 600, P2D);
  forest = loadImage("forest2.png");
  x = width/2;
  y = height/2;
  imageMode(CENTER);
}

void draw() {
  background(0, 127, 255);
    
  for (int i=0; i<3; i++) {
    x += speedX;
    image(forest, x + (i * 100), y + (i * 50), forest.width * (height / forest.height), height);
  }
  
  if (x > width || x < 0) {
    speedX *= -1;
  }  
}
