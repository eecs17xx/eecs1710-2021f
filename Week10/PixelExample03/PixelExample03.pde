PImage img;

void setup() {
  size(640, 480, P2D);  
  img = loadImage("eggman.jpg");
  img.loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    if (red(img.pixels[i]) > 127) {
      img.pixels[i] = color(0);
    } else if (red(img.pixels[i]) > 127) {
      img.pixels[i] = color(0, 255, 0);
    } else if (green(img.pixels[i]) > 127) {
      img.pixels[i] = color(255, 0, 255);
    }
  }
  img.updatePixels();
}

void draw() { 
  image(img, 0, 0);
}
