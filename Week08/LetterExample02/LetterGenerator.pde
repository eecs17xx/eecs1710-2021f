class LetterGenerator {
  
  PShape a, b;
  PShape output;
  
  LetterGenerator(String input) {
    zzinitShapes();
    
    for (int i=0; i<input.length(); i++) {
      char c = input.charAt(i);
      switch(c) {
        case 'a':
          output = a;
          break;
        case 'b':
          output = b;
          break;
      }
    }
  }

  void zzinitShapes() {
    a = createShape();
    a.beginShape();
    a.vertex(4.288147, -3.430542);
    a.vertex(-175.81473, 353.3448);
    a.vertex(-43.739258, 220.41168);
    a.vertex(57.461426, 219.55405);
    a.vertex(177.53, 358.4906);
    a.endShape(CLOSE);
    
    b = createShape();
    b.beginShape();
    b.vertex(0.0, 0.0);
    b.vertex(-11.149227, 313.036);
    b.vertex(202.40138, 230.70326);
    b.vertex(59.17667, 145.7976);
    b.vertex(204.97429, 24.871357);
    b.endShape(CLOSE);   
  }
  
  void update() {
    //
  }
  
  void draw() {
    shape(a, width/2, height/2);
    shape(b, width/2 + 100, height/2);
  }
  
  void run() {
    update();
    draw();
  }

}
