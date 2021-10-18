class Particle {
  
  PVector position;
  PVector speed;
  
  Particle(float x, float y) {
    position = new PVector(x, y);
  }
  
  void update() {
    // TODO
  }
  
  void draw() {
    ellipse(position.x, position.y, 10, 10);
  }
  
  void run() {
    update();
    draw();  
  }
  

}
