class Food {
  
  PVector position;
  float sizeVal;
  boolean alive = true;
  
  Food(float x, float y) {
    position = new PVector(x, y);
    sizeVal = random(10, 15);
  }
  
  void update() {
    // TODO
  }
  
  void draw() {
    if (alive) {
      ellipseMode(CENTER);
      noStroke();
      fill(0);
      ellipse(position.x, position.y, sizeVal, sizeVal);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}
