class Steve {
  
  int index;
  PVector position;
  Food target;
  PImage faceCurrent, face01, face02, face03, face04;
  float margin = 50;
  int foodChoice;
  Eye eyeL, eyeR;
  float eyeSize = 40;
  int eyeMarkTime = 0;
  int eyeTimeout = 200;
  float eyeAngle = 0;
  float alphaVal = 255;
  
  boolean isBothered = false;
  int botheredMarkTime = 0;
  int botheredTimeout = 3000; 
  float botheredSpread = 5;
  
  boolean isBlinking = false;
  int blinkMarkTime = 0;
  float blinkTimeout = 4000;
  int blinkDuration = 250;
  
  boolean isHunting = false;
  
  float triggerDistance1 = 100;
  float triggerDistance2 = 25;
  float movementSpeedOrig = 0.04;
  float movementSpeed = movementSpeedOrig;
      
  int hitPointsOrig = 10;
  int hitPoints = hitPointsOrig;
  int hitPointsMarkTime = 0;
  int hitPointsInterval = 1000;
  int eatFoodValue = 1;
  int botheredFoodLevel = 2;
  int neutralFoodLevel = 5;
  boolean alive = true;
  
  // This is the constructor; it needs to have the same name as the class.
  Steve(float x, float y, int _index) {
    index = _index;
    position = new PVector(x, y);
    pickFoodTarget();

    eyeL = new Eye(-45, -20, eyeSize);
    eyeR = new Eye(45, -20, eyeSize);
    blinkTimeout = random(blinkTimeout / 2, blinkTimeout * 1.5); // so they don't all blink at once
    
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
    // if the food index no longer exists, pick another
    if (foodChoice < 0 || foodChoice > foods.size()-1) pickFoodTarget();
    
    // movement speeds up as hit points decrease
    movementSpeed = movementSpeedOrig / ((float) hitPoints / (float) hitPointsOrig);
    
    int t = millis();
    
    if (t > hitPointsMarkTime + hitPointsInterval) {
      hitPoints--;
      hitPointsMarkTime = t;
      if (hitPoints <= 0) {
        alive = false;
      }
    }
        
    if (target != null && t > eyeMarkTime + eyeTimeout) {
      eyeMarkTime = t;
      eyeAngle = atan2(target.position.y - position.y, target.position.x - position.x);
    }


    isBothered = (hitPoints < botheredFoodLevel); // || position.dist(mousePos) < triggerDistance1);
    
    if (isBothered) {
      isHunting = false;
      botheredMarkTime = t;
      faceCurrent = face02; // worried expression
    } else if (!isBothered && t > botheredMarkTime + botheredTimeout) {
      if (!isBlinking && t > blinkMarkTime + blinkTimeout) {
        isBlinking = true;
        blinkMarkTime = t;
      } else if (isBlinking && t > blinkMarkTime + blinkDuration) {
        isBlinking = false;
      }
  
      if (isBlinking) {
        faceCurrent = face04; // blink with happy expression
      } else {
        if (hitPoints < neutralFoodLevel) {
          faceCurrent = face01; // neutral expression
        } else {
          faceCurrent = face03; // happy expression
        }
      }   
      
      // Steve heads toward food if happy
      if (!isHunting) {
        pickFoodTarget();
        isHunting = true;
      } else {
        position = position.lerp(target.position, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
      }
    }
    
    // found a Food
    if (foods.size() > 0) {
      target = foods.get(foodChoice);
      
      if (target.alive && position.dist(target.position) < 5) {
        hitPoints += eatFoodValue;  
        target.alive = false; 
        pickFoodTarget();
      }
    }
    
    position.y += sin(t) / 2;
  }
  
  void draw() {
    // begin tint if health is low
    float hitPercent = (float) hitPoints / (float) hitPointsOrig;
    hitPercent = constrain(hitPercent, 0, 1);
    if (isBothered) {
      alphaVal = random(0, 255);
    } else {
      alphaVal = 255;
    }
    tint(255 * hitPercent, 255, 255 * hitPercent, alphaVal);
    
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
  
    pushMatrix();
    translate(position.x, position.y);
    image(faceCurrent, 0, 0);

    if (!isBlinking && !isBothered) {
      eyeL.run(eyeAngle);
      eyeR.run(eyeAngle);
    }
    popMatrix();
  
    noTint();
    
    if (debug) {
      noFill();
      stroke(0, 255, 0);
      ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
      ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
      line(target.position.x, target.position.y, position.x, position.y);
      stroke(255, 0, 0);
      rect(target.position.x, target.position.y, 10, 10);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
  void pickFoodTarget() {
    if (foods.size() > 0) {
      foodChoice = int(random(foods.size()));
      target = foods.get(foodChoice);
    }
  }
  
}
