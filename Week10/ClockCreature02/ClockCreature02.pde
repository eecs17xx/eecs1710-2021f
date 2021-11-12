int numSteves = 10;
int numFoods = 100;
ArrayList<Steve> steves = new ArrayList<Steve>();
ArrayList<Food> foods = new ArrayList<Food>();
boolean debug = false;
PImage terrain;
ArrayList<PVector> foodSpawnCoords, steveSpawnCoords;

int addFoodInterval = 500;
int foodMarkTime = 0;

int reproduceThreshold = 5;
int reproduceMarkTime = 0;
int reproduceInterval = 10000;

void setup() {
  size(800, 600, P2D);
  noCursor();
  
  terrain = loadImage("terrain.png");
  terrain.loadPixels();
  foodSpawnCoords = new ArrayList<PVector>();
  steveSpawnCoords = new ArrayList<PVector>();
  for (int x=0; x<terrain.width; x++) {
    for (int y=0; y<terrain.height; y++) {
      int loc = x + y * width;
      color col = terrain.pixels[loc];
      if (red(col) > 200) foodSpawnCoords.add(new PVector(x, y));
      if (blue(col) > 200) steveSpawnCoords.add(new PVector(x, y));
    }
  }
  
  for (int i=0; i<numSteves; i++) {
    int index = int(random(steveSpawnCoords.size()));
    PVector spawnPos = steveSpawnCoords.get(index);
    steves.add(new Steve(spawnPos.x, spawnPos.y, i));
  }
  
  for (int i=0; i<numFoods; i++) {
    int index = int(random(foodSpawnCoords.size()));
    PVector spawnPos = foodSpawnCoords.get(index);
    foods.add(new Food(spawnPos.x, spawnPos.y));
  }
}

void draw() {
  int t = millis();
  
  if (t > foodMarkTime + addFoodInterval) {
    int index = int(random(foodSpawnCoords.size()));
    PVector spawnPos = foodSpawnCoords.get(index);
    foods.add(new Food(spawnPos.x, spawnPos.y));
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
