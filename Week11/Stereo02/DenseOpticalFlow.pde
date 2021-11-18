// Compares two images from a sequence and finds the motion of each pixel from the first
// image to the second image

import boofcv.processing.*;
import boofcv.struct.image.*;

SimpleDenseOpticalFlow flow;
PImage depth;
boolean armUpdateL = false;
boolean armUpdateR = false;

void setupDenseOpticalFlow() {
  flow = Boof.flowHornSchunckPyramid(null, ImageDataType.F32);
  //flow = Boof.flowBroxWarping(null,ImageDataType.F32);
  //flow = Boof.flowKlt(null,6,ImageDataType.F32);
  //flow = Boof.flowRegion(null,ImageDataType.F32);
  //flow = Boof.flowHornSchunck(null,ImageDataType.F32);

  depth = createImage(videoWidth, videoHeight, RGB);
}

void updateDenseOpticalFlow() {
  if (armUpdateL && armUpdateR) {
    // process and visualize the results.  The optical flow data can be access via getFlow()
    flow.process(imgL, imgR);
    depth = flow.visualizeFlow();
    
    armUpdateL = false;
    armUpdateR = false;
  }  
}
