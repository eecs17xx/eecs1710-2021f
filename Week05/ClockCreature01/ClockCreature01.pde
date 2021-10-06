int numSteves = 10;
int numFoods = 100;
ArrayList<Steve> steves = new ArrayList<Steve>();
ArrayList<Food> foods = new ArrayList<Food>();

void setup() {
  size(800, 600, P2D);
  for (int i=0; i<numSteves; i++) {
    steves.add(new Steve(random(width), random(height)));
  }
  
  for (int i=0; i<numFoods; i++) {
    foods.add(new Food(random(width), random(height)));
  }
}

void draw() {
  background(127);
  
  for (int i=foods.size()-1; i>=0; i--) {
    Food food = foods.get(i);
    food.run();
    if (!food.alive) {
      foods.remove(i);
    }
  }
  
  for (int i=steves.size()-1; i>=0; i--) {
    Steve steve = steves.get(i);
    steve.run();
    if (!steve.alive) {
      steves.remove(i);
    }
  }
   
  surface.setTitle("" + frameRate);
}
