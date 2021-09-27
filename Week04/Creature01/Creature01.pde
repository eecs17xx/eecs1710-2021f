PVector position, target;
boolean isRunning = false;

void setup() { 
  size(800, 600, P2D);
  
  position = new PVector(width/2, height/2);
  target = new PVector(random(width), random(height));  
  
  ellipseMode(CENTER);
}

void draw() {
  background(127);
  
  PVector mousePos = new PVector(mouseX, mouseY);
  isRunning = position.dist(mousePos) < 100;
  
  if (isRunning) {
    position = position.lerp(target, 0.08);
    if (position.dist(target) < 5) {
      target = new PVector(random(width), random(height));
    }
  }
  
  ellipse(position.x, position.y, 20, 20);
}
