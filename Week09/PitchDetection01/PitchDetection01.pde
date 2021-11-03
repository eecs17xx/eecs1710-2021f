float scaleAmp = 1000;
float scaleFreq = 500;

void setup() {
  size(800, 600, P2D);  
  setupMinim();
}

void draw() {
  background(127);
  
  updateMinim();
  
  println(band + " " + fft.specSize());
  println("amp: " + amp + " freq: " + freq);

  rectMode(CENTER);
  float fillValR = constrain(map(freq, 0, scaleFreq, 0, 255), 0, scaleFreq);
  float fillValG = constrain(map(freq, 0, scaleFreq, 0, 127), 0, scaleFreq);
  float fillValB = constrain(map(freq, 0, scaleFreq, 0, 63), 0, scaleFreq);
  fill(fillValR, fillValG, fillValB);
  rect(width/2, height - (amp * scaleAmp), 250, amp * scaleAmp);
}

void exit() {
  stopMinim();
}
