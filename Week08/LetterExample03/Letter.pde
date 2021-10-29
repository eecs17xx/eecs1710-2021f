class Letter {
  
  PShape s;
  PVector position;
  PVector[] vertices;
  float spread = 0.2;
  
  Letter(PShape _s, float x, float y) {
    s = _s;
    position = new PVector(x, y, random(-10, 10));
    vertices = new PVector[s.getVertexCount()];
  }
  
  void update() {
    for (int i=0; i<vertices.length; i++) {
      vertices[i] = s.getVertex(i);
      vertices[i].add(new PVector(random(-spread, spread), random(-spread, spread)));
      s.setVertex(i, vertices[i]);
    }
  }
  
  void draw() {
    pushMatrix();
    shapeMode(CENTER);
    translate(position.x, position.y, position.z);
    shape(s, 0, 0);
    popMatrix();
  }
  
  void run() {
    update();
    draw();
  }
  
}
