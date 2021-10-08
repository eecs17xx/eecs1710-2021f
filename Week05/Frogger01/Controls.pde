void keyPressed() {
  if (key == ' ') {
    player.moveForward(); 
  } else if (key == 'd') { // toggle debug mode
    debug = !debug;
  } else if (key == 'r') { // reset
    player.init();
  }
}
