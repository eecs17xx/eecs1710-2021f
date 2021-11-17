import gab.opencv.*;

OpenCV openCv;
PShape ps;

ArrayList<Contour> contours;
int threshold = 33;
float contourDetail = 1; // smaller values mean more detail
boolean armOpenCvUpdate = false;
float scaler = 2;
float minContourArea = 50;
float maxContourArea = 500;

void openCvSetup(PImage img) { 
  openCv = new OpenCV(this, img);
  ps = createShape(GROUP);
}

void openCvUpdate(PImage img) {
  if (armOpenCvUpdate) {
    openCv.loadImage(img);
    openCv.gray();
    openCv.threshold(threshold);
    contours = openCv.findContours();
    
    for (int i=ps.getChildCount()-1; i>=0; i--) {
      ps.removeChild(i);
    }
    
    for (Contour contour : contours) {   
      PShape childPolygon = createShape();
      childPolygon.beginShape();
      childPolygon.stroke(255, 0, 0);
      childPolygon.noFill();
      childPolygon.beginShape();
      contour.setPolygonApproximationFactor(contourDetail);
      for (PVector point : contour.getPolygonApproximation().getPoints()) {
        childPolygon.vertex(point.x, point.y);
      }
      childPolygon.endShape();
      ps.addChild(childPolygon);
      
      float area = contour.area();
      if (area > minContourArea && area < maxContourArea) {
        PShape childCentroid = createShape();
        childCentroid.beginShape(POINTS);
        java.awt.Rectangle rect = contour.getBoundingBox();
        PVector center = new PVector(rect.x + (rect.width/2), rect.y + rect.height/2);

        childCentroid.stroke(255, 255, 0);
        childCentroid.strokeWeight(2);        
        childCentroid.vertex(rect.x, rect.y);
        childCentroid.vertex(rect.width, rect.y);
        childCentroid.vertex(rect.width, rect.height);
        childCentroid.vertex(rect.x, rect.height);

        childCentroid.stroke(0, 255, 0);
        childCentroid.strokeWeight(5);
        childCentroid.vertex(center.x, center.y);
        childCentroid.endShape();
        
        ps.addChild(childCentroid);
      }
    }
  }
}
