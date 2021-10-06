import gifAnimation.*;

Gif gif;

void setup() {
  size(800, 600, P2D);
  gif = new Gif(this, "megaman.gif");
  //gif.loop();
  //gif.play();
  imageMode(CENTER);
  noCursor();
}

void draw() {
  background(127);
  
  if (mousePressed) {
    gif.jump(0);
  }
  
  image(gif, mouseX, mouseY, 128, 128);
}

void keyPressed() {
  if (gif.isPlaying()) {
    gif.stop();  
  } else {
    gif.play();
  }
}
