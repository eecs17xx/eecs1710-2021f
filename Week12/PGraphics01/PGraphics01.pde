PImage img;
PGraphics pg;

void setup() {
  size(800, 600, P2D);
  
  img = loadImage("lucy.jpg");
  
  pg = createGraphics(img.width/10, img.height/10, P2D);
}

void draw() {
  background(127);

  stroke(0, 255, 0);
  fill(255, 127, 0);
  ellipse(0, height/2, 100, 100);
  
  pushMatrix();
  scale(2.0);
  pg.beginDraw();
  pg.image(img, 0, 0, pg.width, pg.height);
  pg.filter(GRAY);
  pg.filter(BLUR);
  pg.endDraw();
  
  image(pg, 0, 0);
  popMatrix();
  
  image(img, 200, 0);
}
