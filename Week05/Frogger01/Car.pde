class Car {
  
  boolean isLeft;
  PVector position, target;
  color col = color(random(127)+127, random(127)+127, random(127)+127);
  float movementSpeed = 0.05;
  float xMargin = 500;
  float yMargin = 150;
  
  Car() {
    float pickSide = random(1);
    float y = random(yMargin, height-yMargin);
    float x1, x2;
    if (pickSide < 0.5) {
      isLeft = true;
      x1 = -xMargin;
      x2 = width + xMargin;
    } else {
      isLeft = false;
      x1 = width + xMargin;
      x2 = -xMargin;
    }
    position = new PVector(x1, y);  
    target = new PVector(x2, y);  
  }
  
  void update() {
    position.lerp(target, movementSpeed);
  }
  
  void draw() {
    rectMode(CENTER);
    fill(col);
    rect(position.x, position.y, 150, 40);
  }
  
  void run() {
    update();
    draw();
  }
    
}
