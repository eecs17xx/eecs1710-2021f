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
  capture = new Capture(this, cameraNames[whichCamera]);    
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
}

void movieEvent(Movie m) {
  m.read();
  videoImg = m;
}
