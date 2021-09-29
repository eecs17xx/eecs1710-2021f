PVector position, target;
boolean isBothered = false;
PImage faceCurrent, face01, face02, face03, face04;
int markTime = 0;
int timeout = 3000;
float triggerDistance1 = 100;
float triggerDistance2 = 5;
float movementSpeed = 0.08;
boolean debug = false;
boolean isBlinking = false;

void setup() { 
  size(800, 600, P2D);
  
  position = new PVector(width/2, height/2);
  target = new PVector(random(width), random(height));  
  
  face01 = loadImage("face01.png");
  face01.resize(face01.width/3, face01.height/3);
  face02 = loadImage("face02.png");
  face02.resize(face01.width, face01.height);
  face03 = loadImage("face03.png");
  face03.resize(face01.width, face01.height);
  face04 = loadImage("face04.png");
  face04.resize(face01.width, face01.height);
  
  faceCurrent = face01;
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
}

void draw() {
  background(127);
  
  PVector mousePos = new PVector(mouseX, mouseY);
  isBothered = position.dist(mousePos) < triggerDistance1;
  
  if (isBothered) {
    markTime = millis();
    faceCurrent = face02; // worried expression
    position = position.lerp(target, movementSpeed);
    if (position.dist(target) < triggerDistance2) {
      target = new PVector(random(width), random(height));
    }
  } else if (!isBothered && millis() > markTime + timeout) {
    if (millis() % 10 == 0) {
      isBlinking = true;
    }

    if (isBlinking) {
      faceCurrent = face04; // happy expression
    } else {
      faceCurrent = face03; // happy expression
    }
  } else {
    faceCurrent = face01; // neutral expression
  }

  image(faceCurrent, position.x, position.y);

  if (debug) {
    noFill();
    ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
    ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
    line(target.x, target.y, position.x, position.y);
    rect(target.x, target.y, 10, 10);
  }
}
