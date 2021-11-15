import processing.video.*;

boolean liveCapture = true;

Movie movie;
Capture capture;
int whichCamera = 0;
PImage videoImg;
int videoWidth = 640;
int videoHeight = 480;

void videoSetup() {
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
}

void captureEvent(Capture c) {
  c.read();
  videoImg = c;
}

void movieEvent(Movie m) {
  m.read();
  videoImg = m;
}
