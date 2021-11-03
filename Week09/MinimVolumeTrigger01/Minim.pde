import ddf.minim.*;

Minim minim;
AudioInput in;
int bufferSize = 512;
float amp = 0;

void setupMinim() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, bufferSize);
}

void stopMinim() {
  in.close();
  minim.stop();
}

void updateMinim() {
  amp = getAmp();
}

float getAmp() {
  return in.mix.level();
}
