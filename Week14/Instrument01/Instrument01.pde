ArrayList<Stroke> strokes;
int marktime = 0;
int timeout = 1000;

void setup() {
  size(800, 600, P2D);
  setupXYscope();
  
  strokes = new ArrayList<Stroke>();
}

void draw() {
  background(127);

  updateXYscope();
  
  for (int i=strokes.size()-1; i >= 0; i--) {
    Stroke stroke = strokes.get(i);
    stroke.run();
    if (!stroke.alive) strokes.remove(i);
  }
  
  if (millis() > marktime + timeout) {
    xy.clearWaves();
  }
}
