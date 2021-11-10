PImage img1, img2;
ArrayList<Dot> dots;
ArrayList<PVector> targets1, targets2;
int scaler = 2; // will use only every 2nd pixel from the image
int threshold = 200;
boolean imageToggled = false;
color col1, col2;

void setup() {
  size(50, 50, P2D);  
  img1 = loadImage("eggman1.png");
  img2 = loadImage("welcome.png");
  
  // set the window size to the largest sides of each image
  int w, h;
  if (img1.width > img2.width) {
    w = img1.width;
  } else {
    w = img2.width;
  }
  if (img1.height > img2.height) {
    h = img1.height;
  } else {
    h = img2.height;
  }
  surface.setSize(w, h);
  
  img1.loadPixels();
  img2.loadPixels();
  
  targets1 = new ArrayList<PVector>();
  targets2 = new ArrayList<PVector>();
  
  col1 = color(255, 127, 0, 63);
  col2 = color(0, 127, 255, 63);
  
  for (int x = 0; x < img2.width; x += scaler) {
    for (int y = 0; y < img2.height; y += scaler) {
      // this translates x and y coordinates into a location in the pixels array
      int loc = x + y * img2.width;

      if (brightness(img2.pixels[loc]) > threshold) {
        targets2.add(new PVector(x, y));
      }
    }
  }

  dots = new ArrayList<Dot>();

  for (int x = 0; x < img1.width; x += scaler) {
    for (int y = 0; y < img1.height; y += scaler) {
      int loc = x + y * img1.width;
      
      if (brightness(img1.pixels[loc]) > threshold) {
        int targetIndex = int(random(0, targets2.size()));
        targets1.add(new PVector(x, y));
        Dot dot = new Dot(x, y, col1, targets2.get(targetIndex));
        dots.add(dot);
      }
    }
  }
}

void draw() { 
  background(0);
  
  blendMode(ADD);
  
  boolean flipTargets = true;

  for (Dot dot : dots) {
    dot.run();
    if (!dot.ready) flipTargets = false;
  }
  
  if (flipTargets) {
    for (Dot dot : dots) {
      if (!imageToggled) {
        int targetIndex = int(random(0, targets1.size()));
        dot.target = targets1.get(targetIndex);
        dot.col = col2;
      } else {
        int targetIndex = int(random(0, targets2.size()));
        dot.target = targets2.get(targetIndex);
        dot.col = col1;
      }
    }
    imageToggled = !imageToggled;
  }
    
  surface.setTitle("" + frameRate);
}
