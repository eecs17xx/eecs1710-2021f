class Ball {
  
  float x;
  float y;
  
  Ball() {
    x = width/2;
    y = height/2;
  }
  
  void draw() {
    ellipseMode(CENTER);
    strokeWeight(20);
    stroke(0,0,255);
    fill(255, 127, 0);
    ellipse(x, y, 100, 100);
  } 

}
