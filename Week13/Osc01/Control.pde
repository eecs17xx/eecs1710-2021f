void mousePressed() {
  if (button.hovered) {
    oscSendData = 1;
    oscSend();
  }
}

void mouseReleased() {
  oscSendData = 0;
  oscSend();
}
