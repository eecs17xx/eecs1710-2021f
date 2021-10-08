Player player;

void setup() {
  size(800, 600, P2D);
  
  player = new Player(width/2, height - 50);
}

void draw() {
  background(127);
  
  fill(0);
  rectMode(CENTER);
  rect(width/2, height/2, width, height * 0.6);
  
  player.run();
}
