float steve = 5;

void setup() {
  size(800, 600, P2D);
}

void draw() {
  background(255,0,0);
  fill(0,0,255);
  
  float x = width / 2 + random(-steve, steve);
  float y = height / 2 + random(-steve, steve);
  
  ellipse(x, y, mouseX, 20);
  
  steve++;
  
  if (steve > 100) {
    steve = 5;
  }
}
