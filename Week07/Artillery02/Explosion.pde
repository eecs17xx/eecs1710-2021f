class Explosion {
 
  PVector position;
  boolean alive = true;
  int timestamp;
  int lifetime = 200;
  
  Explosion(float x, float y) {
    timestamp = millis();
    position = new PVector(x, y);
  }
  
  void update() {
    if (alive && millis() > timestamp + lifetime) alive = false;
  }
  
  void draw() {
    noStroke();
    fill(random(255), random(255), 0);
    ellipse(position.x, position.y, 100, 100);
  }
  
  void run() {
    update();
    draw();
  }
  
}
