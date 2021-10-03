// https://processing.org/examples/arctangent.html

class Eye {
  
  PVector position;
  float size;
  float angle = 0.0;
  
  Eye(float _x, float _y, float _size) {
    position = new PVector(_x, _y);
    size = _size;
 }

  void run() {
    pushMatrix();
    translate(position.x, position.y);
    stroke(0);
    strokeWeight(2);
    fill(255);
    ellipse(0, 0, size, size);
    float x = screenX(position.x, position.y);
    float y = screenY(position.x, position.y);
    angle = atan2(mouseY - y, mouseX - x);
    rotate(angle);
    fill(0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
  
}
