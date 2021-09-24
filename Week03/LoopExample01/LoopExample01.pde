PImage img;

void setup() {
  size(640, 480, P2D);
  img = loadImage("lucy.jpg");
  img.resize(img.width/10, img.height/10);
}

void draw() {
  background(127, 0, 127);
  
  for (int i=0; i<10; i++) {
    float x = random(width);
    float y = random(height);
    
    for (int j=0; j<10; j++) {
      float x2 = x + j;
      float y2 = y + j * 10;
      float alphaVal = abs(255 - ((y2 / height) * 255));
      tint(255, alphaVal);
      image(img, x2, y2);
    }
  }
}
