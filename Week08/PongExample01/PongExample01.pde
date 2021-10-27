float speed = 5;
float yPos;
float yHeight = 50;
float hyHeight = yHeight/2;

void setup() {
  size(800, 600, P2D);
  yPos = height/2;
  rectMode(CENTER);
}

void draw() {
  background(127);
  
  rect(width/2, yPos, 20, yHeight);
  
  yPos += speed;
  
  // keeps the paddle from leaving the window
  if (yPos < hyHeight || yPos > height - hyHeight) speed *= -1;
}

void keyPressed() {
  // we need to check this so the paddle doesn't get stuck
  if (yPos >= hyHeight && yPos <= height - hyHeight) speed *= -1;
}
