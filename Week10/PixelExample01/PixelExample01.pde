PImage imgOrig, img;

void setup() {
  size(640, 480, P2D);  
  imgOrig = loadImage("eggman.jpg");
  imgOrig.loadPixels();
  
  img = imgOrig.get();
  img.loadPixels();
}

void draw() { 
  int index1 = int(random(1, 10));
  int index2 = int(random(1, 10));
  int index3 = int(random(1, 10));
  
  for (int i=0; i<img.pixels.length; i++) {
    if (i % index1 == 0) {
      img.pixels[i] = color(255,0,0);
    } else if (i % index2 == 0) {
      img.pixels[i] = color(0,255,0);
    } else if (i % index3 == 0) {
      img.pixels[i] = color(0,0,255);
    } else {
      img.pixels[i] = imgOrig.pixels[i];    
    }
  }
  img.updatePixels();
  
  image(img, 0, 0);
}
