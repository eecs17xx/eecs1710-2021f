import gab.opencv.*;
import org.opencv.core.Mat;
import org.opencv.calib3d.StereoBM;
import org.opencv.core.CvType;
import org.opencv.calib3d.StereoSGBM;

boolean useSBGM = true;

OpenCV ocvL, ocvR;
PImage imgL, imgR, depth;
Mat left, right, disparity, depthMat;
StereoSGBM stereo;
StereoBM stereo2;

void openCvSetup() {  
  imgL = createImage(videoWidth, videoHeight, RGB);
  imgR = createImage(videoWidth, videoHeight, RGB);
  depth = createImage(videoWidth, videoHeight, RGB);

  ocvL = new OpenCV(this, imgL);
  ocvR = new OpenCV(this, imgR); 
  stereo =  new StereoSGBM(0, 32, 3, 128, 256, 20, 16, 1, 100, 20, true);
  stereo2 = new StereoBM();
}

void openCvUpdate() {
  ocvL.loadImage(imgL);
  ocvR.loadImage(imgR);

  ocvL.gray();
  ocvR.gray();
  
  left = ocvL.getGray();
  right = ocvR.getGray();
  disparity = OpenCV.imitate(left);
  
  if (useSBGM) {
    stereo.compute(left, right, disparity);
  
    depthMat = OpenCV.imitate(left);
    disparity.convertTo(depthMat, depthMat.type());
      
    ocvL.toPImage(depthMat, depth);
  } else {
    stereo2.compute(left, right, disparity );
    
    depthMat = OpenCV.imitate(left);
    disparity.convertTo(depthMat, depthMat.type());
  
    ocvL.toPImage(depthMat, depth);
  }
}
