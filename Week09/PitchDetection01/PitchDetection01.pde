float height3;
float height23;
float spectrumScale = 4;

void setup() {
  size(800, 600, P2D);  
  setupMinim();
  height3 = height/3;
  height23 = 2 * height/3;
}

void draw() {
  updateMinim();
  
  float centerFrequency = fft.getAverageCenterFrequency(fft.avgSize()/2);
  println(centerFrequency);
}

void exit() {
  stopMinim();
}
