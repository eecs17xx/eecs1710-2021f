PImage img;
PShader shader_thresh; 

void setup() {
  size(800, 600, P2D);
  
  img = loadImage("alien.jpg");
  
  shader_thresh = loadShader("shaders/thresh.glsl");
  shader_thresh.set("iResolution", float(width), float(height), 1.0);
}

void draw() {
  background(0);
  
  shader_thresh.set("threshold", 255 * ((float) mouseX / (float) width)); 
  shader_thresh.set("tex0", img);
  filter(shader_thresh);
  
  surface.setTitle("" + frameRate);
}
