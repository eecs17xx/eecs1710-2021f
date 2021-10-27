LetterGenerator lg;
String input = "abc";

void setup() {
  size(800, 600, P2D);
  lg = new LetterGenerator(input, 0, height/2);
}

void draw() {
  background(127);
  
  lg.run();
  
  ellipse(width/2, height/2, 10, 10);
}
