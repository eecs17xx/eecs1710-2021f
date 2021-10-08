class Player {
  
  PVector position, target;
  float movementStep = 50;
  float movementSpeed = 0.1;
  color col = color(127, 255, 10);
  boolean alive = true;
  
  Player(float x, float y) {
    position = new PVector(x, y);
    target = position.copy();
  }
  
  void moveForward() {
    target.y -= movementStep;
  }
  
  void update() {
    position.lerp(target, movementSpeed);
  }
  
  void draw() {
    rectMode(CENTER);
    if (alive) {
      fill(col);
    } else {
      fill(255,0,0);
    }
    rect(position.x, position.y, 50, 100);
  }
  
  void run() {
    update();
    draw();
  }
  
}
