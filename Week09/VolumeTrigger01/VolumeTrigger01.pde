float maxThreshold = 0.1;
float minThreshold = 0.01;

void setup() {
  size(800, 600, P2D);  
  setupMinim();
}

void draw() {
  updateMinim();
  
  float amp = getLevel();
  
  // using two thresholds instead of one makes for smoother transitions
  if (amp > maxThreshold) {
    background(0,255,0);
  } else if (amp < minThreshold) {
    background(255,0,0);
  }
}

void exit() {
  stopMinim();
}
