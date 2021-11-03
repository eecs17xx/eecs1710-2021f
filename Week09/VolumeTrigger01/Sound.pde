import processing.sound.*;

Amplitude amplitude;
AudioIn in;
float amp = 0;

void setupSound() {
  amplitude = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amplitude.input(in);
}

void updateSound() {
  amp = getAmp();
}

float getAmp() {
  return amplitude.analyze();
}
