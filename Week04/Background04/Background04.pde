PImage forest;

int numBgs = 100;
float xOffset = 40;
float yOffset = 0.3;
float startingSpeed = 2;
float speedIncrement = 0.5;

PVector[] positions = new PVector[numBgs];
float[] speeds = new float[numBgs];

void setup() {
  size(800, 600, P2D);
  forest = loadImage("forest2.png");
  forest.resize(forest.width * (height / forest.height), height);
  imageMode(CENTER);
  
  for (int i=0; i<numBgs; i++) {
    positions[i] = new PVector(width/2 + (i * xOffset), height/2 + (i * yOffset));
    speeds[i] = startingSpeed + (i * speedIncrement);
  }
}

void draw() {
  background(0, 127, 255);
    
  for (int i=0; i<numBgs; i++) {
    tint(255, (255 / numBgs) * i);
    image(forest, positions[i].x, positions[i].y);
   
    positions[i].x += speeds[i];
    
    if (positions[0].x > width || positions[0].x < 0) {
      speeds[i] *= -1;
    }
  }
}
