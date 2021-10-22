Sprite sprite1, sprite2;

void setup() {
  size(800, 600, P2D);
  sprite1 = new Sprite("runner1", 12, width/4, height/2);
  sprite2 = new Sprite("runner2", 30, 150, 185, 6, 5, width - (width/4), height/2);
  
}

void draw() {
  background(127);
  
  sprite1.run();
  sprite2.run();
  
  surface.setTitle("" + frameRate);
}
