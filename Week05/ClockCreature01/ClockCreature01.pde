int numSteves = 10;
int numFoods = 100;
ArrayList<Steve> steves = new ArrayList<Steve>();
ArrayList<Food> foods = new ArrayList<Food>();
boolean debug = false;

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
  
  // first go forward through the arraylists to run the game logic
  for (int i=0; i<foods.size()-1; i++) {
    foods.get(i).run();
  }

  for (int i=0; i<steves.size()-1; i++) {
    steves.get(i).run();
  }

  // then go backward through the arraylists to remove anything not alive
  for (int i=foods.size()-1; i>=0; i--) {
    Food food = foods.get(i);
    if (!food.alive) {
      foods.remove(i);
    }
  }
  
  for (int i=steves.size()-1; i>=0; i--) {
    Steve steve = steves.get(i);
    if (!steve.alive) {
      steves.remove(i);
    }
  }
   
  surface.setTitle("" + frameRate);
}

void keyPressed() {
  debug = !debug;
}
