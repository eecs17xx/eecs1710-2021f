class Player {
  
  PVector position;
  
  Player(float x, float y) {
    position = new PVector(x, y);
  }
  
  void update() {
    // TODO
  }
  
  void draw() {
    rectMode(CENTER);
    fill(255);
    rect(position.x, position.y, 50, 100);
  }
  
  void run() {
    update();
    draw();
  }
  
}
