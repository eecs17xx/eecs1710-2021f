Player player;
ArrayList<Car> cars;

int timeLimit = 60;
int currentTime = 0;
int markTime = 0;
int carInterval = 1000;
float crashRange = 100;
boolean debug = true;

PFont font;
int fontSize = 48;

void setup() {
  size(800, 600, P2D);
  font = createFont("Arial", fontSize);
  textFont(font, fontSize);
  player = new Player(width/2, height - 50);
  cars = new ArrayList<Car>();
}

void draw() {
  int t = millis();
  currentTime = abs(timeLimit - int(t/1000));
  
  if (t > markTime + carInterval) {
    cars.add(new Car());
    markTime = t;
  }
  
  background(127);
  
  fill(0);
  rectMode(CENTER);
  rect(width/2, height/2, width, height * 0.6);
  
  for (Car car : cars) {
    car.run();
    if (player.position.dist(car.position) < crashRange) player.alive = false;
  }
  
  player.run();
  
  if (debug) {
    noFill();
    stroke(0,255,0);
    ellipse(player.position.x, player.position.y, crashRange*2, crashRange*2);
  }
  
  fill(255);
  text(currentTime, 10, fontSize);
  
  surface.setTitle("" + frameRate);
}
