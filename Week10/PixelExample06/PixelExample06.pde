PImage img;
ArrayList<Dot> dots;
int scaler = 10; // will use only every 10th pixel from the image

void setup() {
  size(50, 50, P2D);  
  img = loadImage("eggman1.png");
  surface.setSize(img.width, img.height);
  
  img.loadPixels();
  dots = new ArrayList<Dot>();

  for (int x = 0; x < img.width; x += scaler) {
    for (int y = 0; y < img.height; y += scaler) {
      // this translates x and y coordinates into a location in the pixels array
      int loc = x + y * (img.width);
      
      dots.add(new Dot(x, y, img.pixels[loc]));
    }
  }
}

void draw() { 
  background(127);
  
  for (Dot dot : dots) {
    dot.run();
  }
  
  surface.setTitle("" + frameRate);
}
