void mouseDragged() {
  // add point based on width/height
  xy.line(mouseX, mouseY, pmouseX, pmouseY);
  
  if (strokes.size() > 0) {
    Stroke stroke = strokes.get(strokes.size()-1);
    stroke.points.add(new PVector(mouseX, mouseY));
    stroke.timestamp = millis();
  }

  marktime = millis();
}

void keyPressed() {
  if (keyCode == 8) { // DELETE
    xy.clearWaves();
  }
}

void mousePressed() {
  Stroke stroke = new Stroke();
  strokes.add(stroke);
}

void mouseReleased() {
  //
}
