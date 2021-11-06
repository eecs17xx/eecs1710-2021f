PImage castleImg, forestImg, villageImg, currentImg;
String message = "";
String result = "";
PFont font;
int fontSize = 20;
color fontColor = color(255);
color fontShadowColor = color(0);
PVector textPos, shadowPos;

void setup() {
  size(640,480, P2D);
  
  font = createFont("Arial", fontSize);
  textFont(font);
  textAlign(CENTER);
  textPos = new PVector(width/2, height - (fontSize * 2));
  shadowPos = new PVector(textPos.x + 2, textPos.y + 2);
  
  castleImg = loadImage("castle.jpg");
  forestImg = loadImage("forest.jpg");
  villageImg = loadImage("village.jpg");
  currentImg = castleImg;
}

void draw() {
  if (result.toLowerCase().contains("castle")) {
    currentImg = castleImg;
  } else if (result.toLowerCase().contains("forest")) {
    currentImg = forestImg;
  } else if (result.toLowerCase().contains("village")) {
    currentImg = villageImg;
  }
  
  image(currentImg, 0, 0, width, height);    
  
  fill(fontShadowColor);
  text(message, shadowPos.x, shadowPos.y);
  fill(fontColor);
  text(message, textPos.x, textPos.y);
}