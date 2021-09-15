PFont font;
int fontSize = 24;
String message = "Hello World!";


void setup() {
  size(800, 600, P2D);
  frameRate(60);
  font = createFont("Arial", fontSize);
  textFont(font, fontSize);
  textAlign(CENTER);
  fill(255, 127, 0);
}

void draw() {
  text(message, mouseX, mouseY);

  surface.setTitle("" + frameRate);
}

void mousePressed() {
  background(random(255), random(255), random(255));
}
