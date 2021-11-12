class Dot {

  PVector position, target;
  color col;
  float speed;
  float dotSize;
  boolean ready;
  
  Dot(float x, float y, color _col, PVector _target) {
    position = new PVector(x, y);
    col = _col;
    target = _target;
    speed = 0.1;
    dotSize = 40;
    ready = false;
  }
  
  void update() {
    position.lerp(target, speed);
    ready = position.dist(target) < 5;
  }
  
  void draw() {
    ellipseMode(CENTER);
    noStroke();
    fill(col);
    ellipse(position.x, position.y, dotSize, dotSize);
  }
  
  void run() {
    update();
    draw();
  }

}
