Dot player;

PVector spawn;
PImage terrain;

void setup() {
  size(800, 600, P2D);
  spawn = new PVector(width/2, 10);
  player = new Dot(spawn.x, spawn.y, color(0, 127, 255), spawn);
  terrain = loadImage("terrain.png");
  terrain.loadPixels();
}

void draw() { 
  background(0);
  
  image(terrain, 0, 0);
  
  println(player.position.x + " " + player.position.y);
  int loc = int(player.position.x) + int(player.position.y) * terrain.width;
  float b = brightness(terrain.pixels[loc]);
  if (b > 200) {
    player.target = spawn.copy();
  }
  println(b);
  player.run();

  surface.setTitle("" + frameRate);
}

void mousePressed() {
  player.target = new PVector(mouseX, mouseY); 
}
