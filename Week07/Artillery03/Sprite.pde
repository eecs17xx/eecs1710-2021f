class Sprite {
  
  PVector position;
  PImage[] frames;
  int currentFrame = 0;
  int markTime = 0;
  int fps = 12;
  int interval = 1000 / fps; 
  
  Sprite(String _url, float _x, float _y) {
    position = new PVector(_x, _y);
    loadFrames(_url);
  }

  Sprite(String _url, int _tileDimX, int _tileDimY, int _numTilesX, int _numTilesY, float _x, float _y) {
    position = new PVector(_x, _y);
    loadSpriteSheet(_url, _tileDimX, _tileDimY, _numTilesX, _numTilesY);
  }
  
  void update() {
    if (millis() > markTime + interval) {
      currentFrame ++;
      markTime = millis();
      if (currentFrame > frames.length-1) currentFrame = 0;
    }
  }
  
  void draw() {
    pushMatrix();
    translate(position.x, position.y);
    imageMode(CENTER);
    image(frames[currentFrame], 0, 0);
    popMatrix();
  }
  
  void run() {
    update();
    draw();
  }
  
  // loads a folder of multiple images
  void loadFrames(String _url) {
    //loads a sequence of frames from a folder
    int filesCounter=0;
    File dataFolder = new File(dataFile(sketchPath()).getAbsolutePath(), "data/"+_url); 
    String[] allFiles = dataFolder.list();
    for (int j=0;j<allFiles.length;j++) {
      if (allFiles[j].toLowerCase().endsWith("png")) {
        filesCounter++;
      }
    }

    frames = new PImage[filesCounter];
   
    for (int i=0; i<frames.length; i++) {
      println("Loading " + _url + "/frame" + (i+1) + ".png");
      frames[i] = loadImage("data/"+_url + "/frame" + (i+1) + ".png");
    }
  }
  
  // loads a single spritesheet image
  void loadSpriteSheet(String _name, int _tileDimX, int _tileDimY, int _numTilesX, int _numTilesY) {
      PImage origImg;
      origImg = loadImage("data/"+_name + ".png");
      
      int tileX = 1;
      int tileY = 1;
      int tileDimX = _tileDimX;
      int tileDimY = _tileDimY;
      int numTilesX = _numTilesX;
      int numTilesY = _numTilesY;

      frames = new PImage[_numTilesX * _numTilesY];
      for (int h=0; h < frames.length; h++) {
        if (tileX + tileDimX <= (numTilesX * tileDimX)) {
          tileX += tileDimX;
        }
        else if (tileY + tileDimY <= (numTilesY * tileDimY)) {
          tileY += tileDimY;
          tileX = 1;
        }
        else {
          tileX = 1;
          tileY = 1;
        }
        println("Loading frame" + (h+1) + " from " + _name + ".png");
        frames[h] = origImg.get(tileX, tileY, tileDimX, tileDimY);
      }
  }    
    
}
