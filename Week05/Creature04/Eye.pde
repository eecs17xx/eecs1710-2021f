// https://processing.org/examples/arctangent.html

class Eye {
  
  PVector position;
  float size, angle, eyeSpeed;
  
  Eye(float _x, float _y, float _size) {
    position = new PVector(_x, _y);
    size = _size;
    angle = 0;
    eyeSpeed = random(0.1, 0.2);
 }

  void run(float _angle) {
    pushMatrix();
    
    translate(position.x, position.y);
    stroke(0);
    strokeWeight(2);
    fill(255);
    ellipse(0, 0, size, size); 
    angle = lerp(angle, _angle, 0.1);
    rotate(angle);
    fill(0);
    ellipse(size/4, 0, size/4, size/4);
    
    popMatrix();
  }
  
}
