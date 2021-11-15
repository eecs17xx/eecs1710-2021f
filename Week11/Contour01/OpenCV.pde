import processing.video.*;
import gab.opencv.*;

boolean liveCapture = true;

Movie movie;
Capture capture;
int whichCamera = 0;
PImage videoImg;
int videoWidth = 640;
int videoHeight = 480;

OpenCV opencv;
ArrayList<Contour> contours;
boolean armCvUpdate = false;
int threshold = 127;

void opencvSetup() {
  videoImg = createImage(videoWidth, videoHeight, RGB);
  
  if (liveCapture) {
    String[] cameraNames = capture.list();
    for (String cameraName : cameraNames) {
      println(cameraName);
    }
    capture = new Capture(this, videoWidth, videoHeight, cameraNames[whichCamera]); 
    capture.start();
  } else {
    movie = new Movie(this, "cat.mp4");
    movie.loop();
    movie.volume(0);
  }
  
  opencv = new OpenCV(this, videoImg);
}

void opencvUpdate() {
  if (armCvUpdate) {
    opencv.loadImage(videoImg);
    opencv.gray();
    opencv.threshold(threshold);
    contours = opencv.findContours();
    armCvUpdate = false;
  }
}

void opencvDraw() {
  for (Contour contour : contours) {
    stroke(255, 0, 0);
    noFill();
    beginShape();
    for (PVector point : contour.getPolygonApproximation().getPoints()) {
      vertex(point.x, point.y);
    }
    endShape();
  }
}

void captureEvent(Capture c) {
  c.read();
  videoImg = c;
  armCvUpdate = true;
}

void movieEvent(Movie m) {
  m.read();
  videoImg = m;
  armCvUpdate = true;
}
