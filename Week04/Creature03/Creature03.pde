Steve steve;

void setup() { 
  size(800, 600, P2D);
  
  steve = new Steve();
}

void draw() {
  background(127);
  
  steve.draw();
}
