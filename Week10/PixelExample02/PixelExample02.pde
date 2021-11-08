PImage img;

void setup() {
  size(640, 480, P2D);  
  img = loadImage("eggman.jpg");
  img.loadPixels();
}

void draw() {  
  for (int i=0; i<1000; i++) {
    int index1 = int(random(0, img.pixels.length));
    int index2 = int(random(0, img.pixels.length));
    img.pixels[index1] = img.pixels[index2];
  }

  img.updatePixels();
    
  image(img, 0, 0);
}
