float x = 0;

void setup() {
  size(800, 600);
  ellipseMode(CENTER);
}

void draw() {
  background(0, 127, 255);
  stroke(255, 127, 0);
  strokeWeight(10);
  fill(100, 186, 255);
  ellipse(x++, height/2, 20, 20);
}
