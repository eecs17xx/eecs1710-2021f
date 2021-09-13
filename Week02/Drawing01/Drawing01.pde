color bgColor = color(0, 255, 0);
float circleSize = 100;

void setup() {
  size(800, 600, P2D); // P2D enables 2D GPU acceleration
  background(bgColor);
}

void draw() {
  rectMode(CORNER);
  fill(bgColor, 5);
  rect(0, 0, width, height);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  fill(0, 127, 255);
  stroke(255, 0, 0);
  line(mouseX, mouseY, pmouseX, pmouseY);
  rect(mouseX, mouseY, circleSize, circleSize);
}
