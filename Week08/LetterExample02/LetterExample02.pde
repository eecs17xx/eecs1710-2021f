LetterGenerator lg;
String input = "a";

void setup() {
  size(800, 600, P2D);
  lg = new LetterGenerator(input);
}

void draw() {
  background(127);
  
  lg.run();
}
