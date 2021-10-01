int numSteves = 10;

Steve[] steves = new Steve[numSteves];

void setup() { 
  size(800, 600, P2D);
  
  for (int i=0; i<steves.length; i++) {
    steves[i] = new Steve(random(width), random(height));
  }
}

void draw() {
  background(127);
  
  for (int i=0; i<steves.length; i++) {
    steves[i].run();
  }
}
