PShader shader_ripple;

ArrayList<Stroke> strokes;
int marktime = 0;
int timeout = 1000;

void setup() {
  size(800, 600, P2D);
  setupXYscope();
  
  strokes = new ArrayList<Stroke>();

  shader_ripple = loadShader("example.glsl");
  shader_ripple.set("resolution", float(width), float(height));
  shader_ripple.set("rate", 0.1);
}

void draw() {
  background(255);

  updateXYscope();

  for (int i=strokes.size()-1; i >= 0; i--) {
    Stroke stroke = strokes.get(i);
    stroke.run();
    if (!stroke.alive) strokes.remove(i);
  }
  
  if (millis() > marktime + timeout) {
    xy.clearWaves();
  }

  shader_ripple.set("time", float(millis())/1000.0);
  shader_ripple.set("tex0", get());
  filter(shader_ripple);
  filter(INVERT);
  
  surface.setTitle("" + frameRate);
}
