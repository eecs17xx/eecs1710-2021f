PShader shader_thresh, shader_rgba, shader_depth_color; 
PGraphics buffer1, buffer2, buffer3;
PImage img; 

void setup() {
  size(800, 600, P2D);
  img = loadImage("alien.jpg");
  img.resize(width, height);
  
  setupCapture(0);
  
  buffer1 = createGraphics(width, height, P2D);
  buffer2 = createGraphics(width, height, P2D);
  buffer3 = createGraphics(width, height, P2D);
  
  shader_thresh = loadShader("shaders/thresh.glsl");
  shader_depth_color = loadShader("shaders/depth_color.glsl");
  shader_rgba = loadShader("shaders/rgba.glsl");
  
  shader_thresh.set("resolution", float(width), float(height), 1.0);
  shader_depth_color.set("resolution", float(width), float(height), 1.0);
  shader_rgba.set("resolution", float(width), float(height), 1.0);
  
}

void draw() {
  image(img, 0, 0);
  
  shader_thresh.set("threshold", 255 * ((float) mouseX / (float) width)); 
  shader_thresh.set("tex0", videoImg);
  buffer1.beginDraw();
  buffer1.filter(shader_thresh);
  buffer1.endDraw();
  
  shader_depth_color.set("tex0", videoImg);
  buffer2.beginDraw();
  buffer2.filter(shader_depth_color);
  buffer2.endDraw();
  
  shader_rgba.set("tex0", buffer2);
  shader_rgba.set("tex1", buffer1);
  buffer3.beginDraw();
  buffer3.filter(shader_rgba);
  buffer3.endDraw();
  
  image(buffer3, 0, 0);
  
  surface.setTitle("" + frameRate);
}
