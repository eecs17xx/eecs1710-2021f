import peasy.*;

PeasyCam cam;
PShape ps;
PShader shader;
float spreadVal = 0.005;

void setup() {
  size(800, 600, P3D);
  
  cam = new PeasyCam(this, 400);
  
  shader = loadShader("shaders/example.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("depth", 1.0);
  shader.set("rate", 1.0);
  
  ps = loadShape("untitled.obj");
  ps.scale(50);
  ps.setFill(color(255, 0, 0));
  ps.setStroke(color(0, 0, 255));
}

void draw() { 
  background(0);
  
  shader.set("time", float(millis())/1000.0);
  shader(shader);
    
  stroke(255, 0, 0);
  noFill();
  for (int i=0; i<ps.getChildCount(); i++) {
    PShape child = ps.getChild(i);
    for (int j=0; j<child.getVertexCount(); j++) {
      PVector pos = child.getVertex(j);
      PVector spread = new PVector(random(-spreadVal, spreadVal), random(-spreadVal, spreadVal), random(-spreadVal, spreadVal));
      pos.add(spread);
      child.setVertex(j, pos);
    }
  }
  
  shape(ps); 

  surface.setTitle("" + frameRate);
}
