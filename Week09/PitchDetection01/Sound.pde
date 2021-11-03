// https://forum.processing.org/one/topic/microphone-pitch-detect.html
// https://github.com/Notnasiul/R2D2-Processing-Pitch/blob/FFT/PitchProject/PitchDetectorFFT.pde

import processing.sound.*;

Amplitude amplitude;
AudioIn in;
FFT fft;
int specSize = 256;
float sampleRate = 44100;
float[] spectrum = new float[specSize];
int band = 0;
float amp = 0;
float freq = 0;

void setupSound() {
  amplitude = new Amplitude(this);
  fft = new FFT(this, specSize);
  in = new AudioIn(this, 0);
  in.start();
  amplitude.input(in);
  fft.input(in);
}


void updateSound() {
  amp = getAmp();
  
  freq = getFreq();
}

float getFreq() {
  fft.analyze(spectrum);
  
  band = 0;
  
  // find frequency band with highest amplitude
  for(int i = 0; i < spectrum.length; i++) {   
    if (spectrum[i] > spectrum[band]) band = i;
  }
  
  // convert the value into Hz
  return band * 0.5 * sampleRate / (float) specSize;
}

float getAmp() {
  return amplitude.analyze();
}
