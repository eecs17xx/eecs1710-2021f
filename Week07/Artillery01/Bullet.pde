class Bullet {
  
  PVector position;
  PVector speed;
  float rot;
  int timestamp;
  
  Bullet(float x, float y, float _rot) {
    position = new PVector(x, y);
    rot = _rot;
    timestamp = millis();
    speed = new PVector(random(-0.1, 0.1), random(-2, -1));
  }
  
  void update() {
    position.add(speed);
    position.y += gravity;
    speed.mult(friction);
    position.y = constrain(position.y, 0, floor);
  }
  
  void draw() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(rot));
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
  
  void run() {
    update();
    draw();  
  }
  

}
