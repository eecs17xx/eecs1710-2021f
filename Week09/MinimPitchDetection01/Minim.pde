// https://forum.processing.org/one/topic/microphone-pitch-detect.html
// https://github.com/Notnasiul/R2D2-Processing-Pitch/blob/FFT/PitchProject/PitchDetectorFFT.pde

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;
int bufferSize = 512;
int band = 0;
float amp = 0;
float freq = 0;

void setupMinim() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, bufferSize);
  fft = new FFT(in.bufferSize(), in.sampleRate());
}

void stopMinim() {
  in.close();
  minim.stop();
}

void updateMinim() {
  fft.forward(in.mix);

  amp = getAmp();
  
  freq = getFreq();
}

float getFreq() {
  band = 0;
  
  // find frequency band with highest amplitude
  for(int i = 0; i < fft.specSize(); i++) {   
    if (fft.getBand(i) > fft.getBand(band)) band = i;
  }
  
  // convert the value into Hz
  return band * 0.5 * (float) in.sampleRate() / (float) in.bufferSize();
}

float getAmp() {
  return in.mix.level();
}
