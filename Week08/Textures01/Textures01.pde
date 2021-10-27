PImage img;
PShape ps;
float rot = 0.01;
float rotDelta = 0.01;

void setup() {
  size(500, 500, P2D);
  
  shapeMode(CENTER);

  img = createImage(width, height, RGB);
  img.loadPixels();
  colorNoise();
  
  ps = createShape();
  ps.beginShape();
  ps.texture(img);
  ps.vertex(0, 0, 0, 0);
  ps.vertex(width, 100, width, 100);
  ps.vertex(0, 100, 0, 100);
  ps.endShape(CLOSE);
  
  background(0);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(rot);
  rot += rotDelta;
  if (rot > TWO_PI) {
    rot = 0;
    colorNoise();
  }

  shape(ps, 0, 0);
  popMatrix();
}

void colorNoise() {
  for (int i=0; i<img.pixels.length; i++) {
    float colorChoice = random(1);
    if (colorChoice < 0.33) {
      img.pixels[i] = color(random(255), random(127), random(127));
    } else if (colorChoice >= 0.33 && colorChoice < 0.66) {
      img.pixels[i] = color(random(127), random(255), random(127));
    } else {
      img.pixels[i] = color(random(127), random(127), random(255));
    }
  }
  img.updatePixels();
}
