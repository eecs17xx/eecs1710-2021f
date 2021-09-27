String[] slideUrls = { "image01.jpg", "image02.jpg", "image03.png" };
PImage[] slides = new PImage[slideUrls.length];
int slideCounter = 0;

void setup() {
  size(800, 600, P2D);
  for (int i=0; i<slides.length; i++) {
    slides[i] = loadImage(slideUrls[i]);
    slides[i].resize(width, height);
  }
}

void draw() {
  background(0);
  image(slides[slideCounter], 0, 0);
}

void keyPressed() {
  if (key == ' ') {
    slideCounter++;
    if (slideCounter > slides.length-1) slideCounter = 0;
  } else if (key == 'z') {
    slideCounter--;
    if (slideCounter < 0) slideCounter = slides.length-1;  
  }
}
