int thresholdDelta = 5;

void keyPressed() {
  switch(keyCode) {
    case UP:
      threshold += thresholdDelta;
      break;
    case DOWN:
      threshold -= thresholdDelta;
      break;
  }
  
  switch (key) {
    case '1':  
      contourDetail = 1;
      break;
    case '2':
      contourDetail = 2;
      break;
    case '3':
      contourDetail = 3;
      break;
  }
  
  threshold = constrain(threshold, 0, 255);
  contourDetail = constrain(contourDetail, 1, 3);
  
  println("threshold: " + threshold + ", contourDetail: " + contourDetail);
}
