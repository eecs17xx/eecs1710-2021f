import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;
import processing.opengl.PGraphics2D;
import processing.opengl.PGraphics3D;

DwPixelFlow context;
DwFilter filter;
PGraphics3D tex;
PMatrix mat_scene;

// This goes immediately after size().
void bloomSetup() {  
  mat_scene = getMatrix();
  tex = (PGraphics3D) createGraphics(width, height, P3D);
  context = new DwPixelFlow(this);
  filter = new DwFilter(context);
  //filter.bloom.setBlurLayers(10);
  filter.bloom.param.mult = 0.5; // 0.0-10.0
  filter.bloom.param.radius = 0.5; // 0.0-1.0
}

// For a simple scene, just put this at the end of the draw loop.
void bloomDraw() {
  filter.bloom.apply(tex);
  image(tex, 0, 0);
}

// Or, for a more complex scene, this goes at the beginning of the draw loop...
void bloomMatrixStart() {
  pushMatrix();
}

// ...and this goes at the end.
void bloomMatrixEnd() {
  setMatrix(mat_scene);
  bloomDraw();
  popMatrix();
}
