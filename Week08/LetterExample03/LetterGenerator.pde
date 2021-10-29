class LetterGenerator {
  
  PShape a, b, c;
  ArrayList<Letter> letters;
  PVector position;
  float offset = 150;
  
  LetterGenerator(String input, float x, float y) {
    initShapes();
    position = new PVector(x, y);
    letters = new ArrayList<Letter>();
    
    for (int i=0; i<input.length(); i++) {     
      char ch = input.charAt(i);
      
      float px = position.x + ((i+1) * offset);
      float py = position.y;
      
      switch(ch) {
        case 'a':
          letters.add(new Letter(a, px, py));
          break;
        case 'b':
          letters.add(new Letter(b, px, py));
          break;
        case 'c':
          letters.add(new Letter(c, px, py));
          break;
      }
    }
    
  }

  void initShapes() {
    a = createShape();
    a.beginShape();
    a.translate(170, 10);
    a.fill(255,0,0);
    a.vertex(4, -3);
    a.fill(0, 255,0);
    a.vertex(-175, 353);
    a.stroke(225);
    a.vertex(-43, 220);
    a.vertex(57, 219);
    a.vertex(177, 358);
    a.beginContour();
    a.vertex(-40,180);
    a.vertex(0, 60);
    a.vertex(40,180);
    a.endContour();
    a.endShape(CLOSE);
    
    b = createShape();
    b.beginShape();
    b.translate(50, 10);
    b.texture(shark);
    b.vertex(0, 0, 0, 0);
    b.vertex(-11, 313, -11, 313);
    b.vertex(202, 230, 202, 230);
    b.vertex(59, 145, 59, 145);
    b.vertex(204, 24, 204, 24);
    b.beginContour();
    b.vertex(40, 120, 40,120);
    b.vertex(40, 30, 40, 30);
    b.vertex(120, 50, 120, 50);
    b.endContour();
    b.beginContour();
    b.vertex(30, 260, 30, 260);
    b.vertex(30, 180, 30, 180);
    b.vertex(110, 230, 110, 230);
    b.endContour();
    b.endShape(CLOSE);   
    
    c = createShape();
    c.beginShape();
    c.texture(shark);
    // normalized UVs are more confusing to work with in Processing,
    // but are more standard in other 3D apps
    c.textureMode(NORMAL);
    c.translate(220, 0);
    c.vertex(0.0, 0.0, 0, 0);
    c.vertex(-177, -7, 0, 1);
    c.vertex(-168, 282, 1, 1);
    c.vertex(51, 269, 0, 1);
    c.vertex(-127, 246, 1, 0);
    c.vertex(-146, 21, 0, 0);
    c.endShape(CLOSE);
  }
  
  void update() {
    //
  }
  
  void draw() {
    for (Letter letter : letters) {
      letter.run();
    }
  }
  
  void run() {
    update();
    draw();
  }

}
