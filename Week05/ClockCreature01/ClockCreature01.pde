int numSteves = 10;
int numFoods = 100;
ArrayList<Steve> steves = new ArrayList<Steve>();
ArrayList<Food> foods = new ArrayList<Food>();
boolean debug = false;

int addFoodInterval = 500;
int foodMarkTime = 0;

int reproduceThreshold = 5;
int reproduceMarkTime = 0;
int reproduceInterval = 10000;

void setup() {
  size(800, 600, P2D);
  noCursor();
  
  for (int i=0; i<numSteves; i++) {
    steves.add(new Steve(random(width), random(height), i));
  }
  
  for (int i=0; i<numFoods; i++) {
    foods.add(new Food(random(width), random(height)));
  }
}

void draw() {
  int t = millis();
  
  if (t > foodMarkTime + addFoodInterval) {
    foods.add(new Food(random(width), random(height)));
    foodMarkTime = t;
  }
  
  if (t > reproduceMarkTime + reproduceInterval) {
    for (int i=steves.size()-1; i>=0; i--) {
      Steve steve = steves.get(i);
      if (steve.hitPoints > reproduceThreshold) {
        steves.add(new Steve(steve.position.x, steve.position.y, steves.size()-1));
      }
    }
    reproduceMarkTime = t;
  }
  
  background(127);
    
  // first go forward through the arraylists to run the game logic
  for (int i=0; i<foods.size(); i++) {
    foods.get(i).run();
  }
  
  String steveReport = "";
  for (int i=0; i<steves.size(); i++) {
    Steve steve = steves.get(i);
    steve.run();
    steveReport += steve.index + ". " + steve.hitPoints + "pts";
    if (i < steves.size()-1) steveReport += ", ";
  }
  println(steveReport);

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
