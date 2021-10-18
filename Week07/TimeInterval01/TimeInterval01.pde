float x = 0;
float speed = 50;

int markTime = 0;
int interval = 1000/12; // 12 fps;

void setup() {
  size(800, 600, P2D);
}

void draw() {
  ellipse(x, height/2, 100, 100);
  
  if (millis() > markTime + interval) {
    x += speed;
    markTime = millis();
  }
  
  if (x < 0 || x > width) {
    x = constrain(x, 0, width);
    speed *= -1;
  }
  
  surface.setTitle("" + frameRate);
}
