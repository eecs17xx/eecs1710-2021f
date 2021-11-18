import processing.video.*;

Movie movie;
Capture capture;

// both of the above objects will be drawing to the PImage videoImg
PImage videoImg;

void setupCapture(int whichCamera) {  
  String[] cameraNames = capture.list();
  for (String cameraName : cameraNames) {
    println(cameraName);
  }
  capture = new Capture(this, 320, 240, cameraNames[whichCamera], 30);    
  capture.start();
}

void setupMovie(String movieUrl) {  
  movie = new Movie(this, movieUrl);
  movie.loop();
  movie.volume(0);
}

void captureEvent(Capture c) {
  c.read();
  videoImg = c;
  armOpenCvUpdate = true;
}

void movieEvent(Movie m) {
  m.read();
  videoImg = m;
  armOpenCvUpdate = true;
}
