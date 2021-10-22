class Cannon {

  PVector position;
  float rot = 0;
  float rotDelta = 2;
  ArrayList<Bullet> bullets;
  PImage img1, img2;
  boolean armRecoil = false;
  float recoilAmount = 4;
  
  Cannon(float x, float y) {
    position = new PVector(x, y);
    bullets = new ArrayList<Bullet>();
    img1 = loadImage("cannon.png");
    img2 = loadImage("base.png");
  }
  
  void update() {
    rot += rotDelta;    
    if (rot < -90 || rot > 90) rotDelta *= -1;  
    
    // remove all bullets that are no longer alive
    for (int i=bullets.size()-1; i>=0; i--) {
      Bullet bullet = bullets.get(i);
      if (bullet.alive) {
        bullet.run();
      } else {
        bullets.remove(i);
      }
    }
  }
  
  void fire() {
    // adding a bit to the rotation is a "cheat"
    // that makes it easier for the player to aim
    bullets.add(new Bullet(position.x, position.y, rot + rotDelta * 2));
    armRecoil = true;
  }
  
  void draw() {
    // back of base
    noStroke();
    fill(0);
    rect(width/2, 506, 8, 30);
    
    // rotating cannon
    pushMatrix(); 
    if (armRecoil) {
      translate(position.x, position.y + recoilAmount);
      armRecoil = false;
    } else {
      translate(position.x, position.y);
    }
    rotate(radians(rot));
    image(img1, 0, 0);
    popMatrix();
    
    // front of base
    image(img2, width/2, 516);
  }
  
  void run() {
    update();
    draw();
  }

}
