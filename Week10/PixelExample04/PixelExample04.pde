PImage img;

void setup() {
  size(640, 480, P2D);  
  img = loadImage("eggman.jpg");
  img.loadPixels();

  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      // this translates x and y coordinates into a location in the pixels array
      int loc = x + y * img.width;
      
      if (y > img.height/2) {
        img.pixels[loc] = color(0, 0, 255);
      }
      
      if (x > img.width/2) {
        float r = 255 - red(img.pixels[loc]);
        float g = 0.4 * green(img.pixels[loc]);
        float b = 0;
        img.pixels[loc] = color(r, g, b);
      }
    }
  }

  img.updatePixels();
}

void draw() { 
  image(img, 0, 0);
}
