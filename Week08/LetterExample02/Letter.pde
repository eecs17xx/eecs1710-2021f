class Letter {
  
  PShape s;
  PVector position;
  
  Letter(PShape _s, float x, float y) {
    s = _s;
    position = new PVector(x, y);
  }
  
  void update() {
    //
  }
  
  void draw() {
    shapeMode(CENTER);
    shape(s, position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }
  
}
