color col = color(127, 0, 255);
color newCol;
float lerpSpeed = 0.05;

void setup() {
  size(800, 600, P2D);
}

void draw() {
  float r = map(mouseX, 0, width, 0, 255); 
  float g = map(mouseY, 0, height, 0, 255); 
  newCol = color(r, g, 255);
  
  col = lerpColor(col, newCol, lerpSpeed);
  
  fill(col);
  ellipse(width/2, height/2, 500, 500);
}
