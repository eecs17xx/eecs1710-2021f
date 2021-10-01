int numSteves = 1;
int numFoods = 10;

Steve[] steves = new Steve[numSteves];
Food[] foods = new Food[numFoods];

void setup() { 
  size(800, 600, P2D);
  
  for (int i=0; i<steves.length; i++) {
    steves[i] = new Steve(random(width), random(height));
  }
  
  for (int i=0; i<foods.length; i++) {
    foods[i] = new Food(random(width), random(height));
  }
}

void draw() {
  background(127);
  
  for (int i=0; i<foods.length; i++) {
    foods[i].run();
  }
  
  for (int i=0; i<steves.length; i++) {
    steves[i].run();
  }
}
