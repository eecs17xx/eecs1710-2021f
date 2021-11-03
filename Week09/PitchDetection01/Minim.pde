import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;
int bufferSize = 512;

void setupMinim() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, bufferSize);
  
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.linAverages(30);
}

void stopMinim() {
  in.close();
  minim.stop();
}

void updateMinim() {
  fft.forward(in.mix);
}
