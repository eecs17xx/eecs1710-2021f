void mousePressed() {
  if (button.hovered) {
    oscSendData[0] = 1;
    oscSend();
  }
}

void mouseReleased() {
  oscSendData[0] = 0;
  oscSend();
}
