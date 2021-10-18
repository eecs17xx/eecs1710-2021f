class Cannon {

  PVector position;
  float rot = 0;
  float rotDelta = 2;
  ArrayList<Bullet> bullets;

  Cannon(float x, float y) {
    position = new PVector(x, y);
    bullets = new ArrayList<Bullet>();
  }
  
  void update() {
    rot += rotDelta;    
    if (rot < -90 || rot > 90) rotDelta *= -1;  
    
    for (Bullet bullet : bullets) {
      bullet.run();
    }
  }
  
  void fire() {
    bullets.add(new Bullet(position.x, position.y, rot));
  }
  
  void draw() {
    pushMatrix(); 
    translate(position.x, position.y);
    rotate(radians(rot));
    rectMode(CENTER);
    rect(0, 0, 50, 100);
    popMatrix();
  }
  
  void run() {
    update();
    draw();
  }

}
