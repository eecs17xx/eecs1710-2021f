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
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(random(360)));
    blendMode(ADD);
    image(explosionImg, 0, 0);
    blendMode(NORMAL);
    popMatrix();
    noStroke();
    fill(random(255), random(255), 0);
    float sizeVal = 100 + random(-50, 50);
    ellipse(position.x, position.y, sizeVal, sizeVal);
  }
  
  void run() {
    update();
    draw();
  }
  
}
