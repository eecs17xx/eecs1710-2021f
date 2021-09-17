PImage img1, img2;
PVector pos1, pos2;
PShape shp;

void setup() {
  size(640, 480, P2D);
  
  img1 = loadImage("starfox.png");
  img2 = loadImage("aliens.jpg");
  
  pos1 = new PVector(300, 300);
  pos2 = new PVector(width, height);
  
  shp = createShape();
  shp.beginShape();
  shp.stroke(255,0,0);
  shp.fill(0,255,0);
  shp.vertex(pos1.x, pos1.y);
  shp.vertex(pos2.x, pos2.y);
  shp.vertex(0, 0);
  shp.endShape();
}

void draw() {
  imageMode(CORNER);
  image(img1, 0, 0, width, height);

  imageMode(CENTER);
  image(img2, mouseX, mouseY, 20, 20);
  
  strokeWeight(20);
  stroke(255,0,0);
  point(pos1.x, pos1.y);
  point(pos2.x, pos2.y);
  
  strokeWeight(10);
  stroke(0,255,0);
  line(pos1.x, pos1.y, pos2.x, pos2.y);
  
  shape(shp);
}
