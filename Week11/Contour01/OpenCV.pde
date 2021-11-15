import gab.opencv.*;

OpenCV openCv;
PShape ps;

ArrayList<Contour> contours;
int threshold = 127;
float contourDetail = 2; // smaller values mean more detail
boolean openCvReady = false;

void openCvSetup(PImage img) { 
  openCv = new OpenCV(this, img);
  openCvReady = true;
  ps = createShape(GROUP);
}

void openCvRun(PImage img) {
  if (armOpenCvUpdate) {
    openCv.loadImage(img);
    openCv.gray();
    openCv.threshold(threshold);
    contours = openCv.findContours();
    
    for (int i=ps.getChildCount()-1; i>=0; i--) {
      ps.removeChild(i);
    }
    
    for (Contour contour : contours) {   
      PShape child = createShape();
      child.beginShape();
      child.stroke(255, 0, 0);
      child.noFill();
      child.beginShape();
      contour.setPolygonApproximationFactor(contourDetail);
      for (PVector point : contour.getPolygonApproximation().getPoints()) {
        child.vertex(point.x, point.y);
      }
      child.endShape();
      ps.addChild(child);
    }
    
    armOpenCvUpdate = false;
  }
  
  if (ps != null) shape(ps);
}
