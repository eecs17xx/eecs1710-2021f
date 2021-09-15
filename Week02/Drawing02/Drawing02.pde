PFont font;
PImage img;
int fontSize = 24;
String message1 = "Hello World!";
String message2 = "W#*&$^*!!";
int colorRange = 55;
int colorOffset = 200;

void setup() {
  size(800, 600, P2D);
  frameRate(60);

  img = loadImage("starfox.png");

  font = createFont("Times New Roman", fontSize);
  textFont(font, fontSize);
  textAlign(CENTER);
  
  // These will draw only once
  background(colorOffset + random(0, colorRange), colorOffset + random(0, colorRange), colorOffset +  random(0, colorRange));
  image(img, 0, 0);  
}

void draw() {  
  if (mousePressed) {
    if (mouseX < width/2) {
      fill(255, 127, 0);
      text(message1, mouseX, mouseY);
    } else {
      fill(0, 127, 255);
      text(message2, mouseX, mouseY);
    }
  }
  
  line(width/2, 0, width/2, height);
  println(mouseX);
  
  surface.setTitle("" + frameRate);
}
