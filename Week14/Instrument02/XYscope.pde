import xyscope.*;
import ddf.minim.*; 

XYscope xy;

void setupXYscope() {
  // initialize XYscope with default sound out
  xy = new XYscope(this);
}


void updateXYscope() {
  // build audio from shapes
  xy.buildWaves();

  // draw all analytics
  //xy.drawAll();
}
