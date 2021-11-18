void setup() {
  size(800, 600, P2D);
  
  // choose whether you're using a live capture, or a movie clip
  setupCapture(0);
  //setupMovie("cat.mp4");
}

void draw() { 
  image(videoImg, 0, 0);
}
