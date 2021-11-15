import processing.video.*;

Movie movie;
Capture capture;

PImage videoImg;
boolean ready = false;

void captureSetup(int whichCamera) {  
  String[] cameraNames = capture.list();
  for (String cameraName : cameraNames) {
    println(cameraName);
  }
  capture = new Capture(this, cameraNames[whichCamera]);    
  capture.start();
}

void movieSetup(String movieUrl) {  
  movie = new Movie(this, movieUrl);
  movie.loop();
  movie.volume(0);
}

void captureEvent(Capture c) {
  c.read();
  if (!ready) {
    videoImg = createImage(capture.width, capture.height, RGB);
    ready = true;
  } else {
    videoImg = capture;
  }
}

void movieEvent(Movie m) {
  m.read();
  if (!ready) {
    videoImg = createImage(movie.width, movie.height, RGB);
    ready = true;
  } else {
    videoImg = movie;
  }
}
