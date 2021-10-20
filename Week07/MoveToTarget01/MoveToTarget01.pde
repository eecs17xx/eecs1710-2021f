PVector target, position;

void setup() {
  size(800, 600, P2D);
  position = new PVector(width/2, height/2);
  target = position.copy();
}

void draw() {
  position.lerp(target, 0.1);
  
  ellipse(position.x, position.y, 10, 10);
}

void mousePressed() {
  target = new PVector(mouseX, mouseY);
}
