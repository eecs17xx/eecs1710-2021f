class Dot {

  PVector position, target;
  color col;
  float speed;
  
  Dot(float x, float y, color _col) {
    position = new PVector(x, y);
    target = new PVector(random(width), random(height));
    col = _col;
    speed = brightness(col) / 100000;
  }
  
  void update() {
    position.lerp(target, speed);
  }
  
  void draw() {
    stroke(col);
    strokeWeight(10);
    point(position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }

}
