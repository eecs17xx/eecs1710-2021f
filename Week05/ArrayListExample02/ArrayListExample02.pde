int numPositions = 10;

// Array
//PVector[] positions = new PVector[numPositions];
//... vs. ...
// ArrayList 
ArrayList<PVector> positions = new ArrayList<PVector>();

int markTime = 0;
int timeout = 500;

void setup() {
  size(800, 600, P2D);
  for (int i=0; i<numPositions; i++) {
    positions.add(new PVector(random(width), random(height)));
  }
}

void draw() {
  background(127);
  
  if (millis() > markTime + timeout) {
    // add
    //positions.add(new PVector(random(width), random(height)));
    // remove
    if (positions.size() > 0) {
      positions.remove(positions.size()-1);
    }
    
    markTime = millis();
  }
  
  for (int i=0; i<positions.size(); i++) {
    ellipse(positions.get(i).x, positions.get(i).y, 10, 10);
  }
  
  surface.setTitle("" + frameRate);
}

void keyPressed() {
  for (int i=0; i<numPositions; i++) {
    positions.add(new PVector(random(width), random(height)));
  }
}
