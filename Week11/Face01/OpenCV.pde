import gab.opencv.*;
import java.awt.Rectangle;

OpenCV openCV;
Rectangle[] faces;
boolean armUpdateOpenCV = false;

void setupOpenCV() {
  openCV = new OpenCV(this, videoWidth, videoHeight);
  openCV.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  faces = new Rectangle[0];
}

void updateOpenCV() {
  if (armUpdateOpenCV) {
    openCV.loadImage(capture);
    
    buffer.beginDraw();
    buffer.image(capture, 0, 0);
    buffer.filter(GRAY);
    buffer.endDraw();
    
    faces = openCV.detect();
    
    armUpdateOpenCV = false;
  }
}
