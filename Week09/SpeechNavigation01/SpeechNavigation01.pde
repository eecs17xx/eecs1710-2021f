PImage castleImg, forestImg, villageImg, currentImg;
String message = "";
PFont font;
int fontSize = 20;
color fontColor = color(255);
color fontShadowColor = color(0);
PVector textPos, shadowPos;

void setup() {
  size(640,480, P2D);
  setupSttReceiver();

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
  if (result.contains("castle")) {
    message = "castle";
    result = "";
    currentImg = castleImg;
  } else if (result.contains("forest")) {
    message = "forest";
    result = "";
    currentImg = forestImg;
  } else if (result.contains("village")) {
    message = "village";
    result = "";
    currentImg = villageImg;
  }
  
  image(currentImg, 0, 0, width, height);    
  
  fill(fontShadowColor);
  text(message, shadowPos.x, shadowPos.y);
  fill(fontColor);
  text(message, textPos.x, textPos.y);
}
