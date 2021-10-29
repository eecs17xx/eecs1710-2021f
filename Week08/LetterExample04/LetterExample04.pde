LetterGenerator lg;
String input = "abcba";
PImage shark;
PGraphics pg;

// window sizes are ints
int scaler = 4;
// the scale command needs a float percentage
float scaler_f = 1.0 / scaler;

void setup() {
  size(800, 600, P3D);
  
  shark = loadImage("shark.jpg");

  lg = new LetterGenerator(input, 0, height/2);

  pg = createGraphics(width/scaler, height/scaler, P3D);
   // this odd-looking method turns off smoothing for a sharper result when scaled
  ((PGraphicsOpenGL)pg).textureSampling(3);
}

void draw() {
  pg.beginDraw();
  
  pg.background(127);
  pg.scale(scaler_f);
  lg.run(); 
  
  pg.endDraw();
  
  image(pg, 0, 0, width, height);
}
