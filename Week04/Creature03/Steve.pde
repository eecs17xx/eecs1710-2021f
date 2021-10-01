class Steve {

  boolean debug = true;
  PVector position, target;
  PImage faceCurrent, face01, face02, face03, face04;
  float margin = 50;
  int foodChoice;
  
  boolean isBothered = false;
  int botheredMarkTime = 0;
  int botheredTimeout = 3000; // Processing measures time in milliseconds
  float botheredSpread = 5;
  
  boolean isBlinking = false;
  int blinkMarkTime = 0;
  int blinkTimeout = 4000;
  int blinkDuration = 250;
  
  boolean isHunting = false;
  
  float triggerDistance1 = 100;
  float triggerDistance2 = 25;
  float movementSpeed = 0.08;
    
  // This is the constructor; it needs to have the same name as the class.
  Steve(float x, float y) {
    position = new PVector(x, y);
    pickEscapeTarget();
    
    face01 = loadImage("face01.png");
    face01.resize(face01.width/3, face01.height/3);
    face02 = loadImage("face02.png");
    face02.resize(face01.width, face01.height);
    face03 = loadImage("face03.png");
    face03.resize(face01.width, face01.height);
    face04 = loadImage("face04.png");
    face04.resize(face01.width, face01.height);
    
    faceCurrent = face01;
  }
  
  void update() {
    PVector mousePos = new PVector(mouseX, mouseY);
    isBothered = position.dist(mousePos) < triggerDistance1;
    
    if (isBothered) {
      isHunting = false;
      botheredMarkTime = millis();
      faceCurrent = face02; // worried expression
      if (position.dist(target) < triggerDistance2) {
        pickEscapeTarget();
      }
    } else if (!isBothered && millis() > botheredMarkTime + botheredTimeout) {
      if (!isBlinking && millis() > blinkMarkTime + blinkTimeout) {
        isBlinking = true;
        blinkMarkTime = millis();
      } else if (isBlinking && millis() > blinkMarkTime + blinkDuration) {
        isBlinking = false;
      }
  
      if (isBlinking) {
        faceCurrent = face04; // blink with happy expression
      } else {
        faceCurrent = face03; // happy expression
      }   
      
      // Steve heads toward food if happy
      if (!isHunting) {
        pickFoodTarget();
        isHunting = true;
      }
    } else if (!isBothered && millis() > botheredMarkTime + botheredTimeout/6) {
      faceCurrent = face01; // neutral expression
    }
  
    if (isBothered || isHunting) {
      position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
    }
    
    if (isHunting && position.dist(target) < 5) {
      foods[foodChoice].alive = false; 
      pickFoodTarget();
    }
    
    position.y += sin(millis()) / 2;
  }
  
  void draw() {    
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
  
    image(faceCurrent, position.x, position.y);
  
    if (debug) {
      noFill();
      stroke(0, 255, 0);
      ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
      ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
      line(target.x, target.y, position.x, position.y);
      stroke(255, 0, 0);
      rect(target.x, target.y, 10, 10);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
  void pickEscapeTarget() {
    target = new PVector(random(margin, width-margin), random(margin, height-margin));
  }
  
  void pickFoodTarget() {
    foodChoice = int(random(foods.length));
    if (foods[foodChoice].alive) {
      target = foods[foodChoice].position;
    }
  }
  
}
