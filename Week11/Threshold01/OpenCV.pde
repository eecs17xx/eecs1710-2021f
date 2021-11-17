import gab.opencv.*;

OpenCV openCv;

int threshold = 33;
boolean armOpenCvUpdate = false;
int scaler = 2;

void openCvSetup(PImage img) { 
  openCv = new OpenCV(this, img);
}

void openCvUpdate(PImage img) {
  if (armOpenCvUpdate) {
    openCv.loadImage(img);
    openCv.gray();
    openCv.threshold(threshold);
    armOpenCvUpdate = false;
  }
}
