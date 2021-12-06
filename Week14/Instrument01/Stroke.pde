class Stroke {
  
  ArrayList<PVector> points;
  int lifetime = 1000;
  int timestamp = 0;
  boolean alive = true;
  
  Stroke() {
    points = new ArrayList<PVector>();
    timestamp = millis();
  }
  
  void update() {
    if (millis() > timestamp + lifetime) {
      alive = false;
    }
  }
  
  void draw() {
    for (int i=0; i<points.size(); i++) {
      PVector p = points.get(i);
      p.x += random(5) - random(5);
      strokeWeight(random(10, 20));
      point(p.x, p.y);
      if (i > 0) {
        PVector p2 = points.get(i-1);
        strokeWeight(2);
        line(p.x, p.y, p2.x, p2.y);
      }
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}
