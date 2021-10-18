int numParticles = 1000;
Particle[] particles = new Particle[numParticles];

float gravity = 0.4;
float friction = 0.99;
float floor;

void setup() {
  size(800, 600, P2D);
  floor = height;
  
  for (int i=0; i<numParticles; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}

void draw() {
  background(127);
  
  for (int i=0; i<particles.length; i++) {
    particles[i].run();
  }
  
  gravity += 0.01;
  
  surface.setTitle("" + frameRate);
}
