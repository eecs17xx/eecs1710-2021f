
void setup() {
  size(800, 600, P2D);
  
  //captureSetup(0);
  movieSetup("cat.mp4");
}

int counter = 0;

void draw() { 
  image(videoImg, 0, 0);
}
