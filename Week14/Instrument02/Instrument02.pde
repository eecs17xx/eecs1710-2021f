PShader shader_ripple;
PGraphics pg;

ArrayList<Stroke> strokes;
int marktime = 0;
int timeout = 1000;

void setup() {
  size(800, 600, P2D);
  pg = createGraphics(800, 600, P2D);
  
  setupXYscope();
  
  strokes = new ArrayList<Stroke>();

  shader_ripple = loadShader("example.glsl");
  shader_ripple.set("resolution", float(width), float(height));
  shader_ripple.set("rate", 0.1);
  
  pg.beginDraw();
  pg.background(0);
  pg.endDraw();
}

void draw() {
  background(0);

  updateXYscope();

  pg.beginDraw();
  if (random(0, 1) < 0.5) pg.blendMode(ADD);
  for (int i=strokes.size()-1; i >= 0; i--) {
    Stroke stroke = strokes.get(i);
    stroke.run();
    if (!stroke.alive && stroke.points.size() == 0) {
      strokes.remove(i);
    }
  }
  
  if (millis() > marktime + timeout) {
    xy.clearWaves();
  }

  shader_ripple.set("time", float(millis())/1000.0);
  shader_ripple.set("tex0", pg);
  pg.filter(shader_ripple);
  
  pg.blendMode(BLEND);
  pg.noStroke();
  pg.fill(0, 5);
  pg.rect(0, 0, width, height);

  pg.endDraw();
  
  image(pg, 0, 0);

  surface.setTitle("" + frameRate);
}
