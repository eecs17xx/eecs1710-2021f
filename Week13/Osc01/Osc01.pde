// based on oscP5parsing by andreas schlegel

import oscP5.*;
import netP5.*;

String ipNumber = "127.0.0.1";
int receivePort = 9000;
int sendPort = 7110;
OscP5 oscP5;
NetAddress myRemoteLocation;
//---
String[] oscChannelNames = { "isadora/1","isadora/2","isadora/3" };
float[] oscReceiveData = { 0,0,0 };
float[] oscSendData = { 0 };
boolean sendOsc = true;

Button button;

PFont font;
int fontSize = 24;
color receiveOff = color(50,0,0);
color receiveOn = color(255,50,0);
color receiveNow = receiveOff;
int sizeOff = 100;
int sizeOn = 110;
int sizeNow = sizeOff;
int depth = 500;

void setup() {
size(640, 480, P2D);

oscSetup();
button = new Button(width/4,height/2,100,color(0,100,50),fontSize,"Send","ellipse");
font = createFont("Arial",fontSize);
}

void draw(){
  background(127);
  fill(0);
  textAlign(CENTER);
  textFont(font,fontSize);
  text("OSC Send",width/4,fontSize*1.5);
  text("OSC Receive",(width/4)+(width/2),fontSize*1.5);
  stroke(0);
  strokeWeight(2);
  line(width/2,0,width/2,height);
  rectMode(CENTER);
  noStroke();
  fill(127);
  rect(width/2,height/4,100,100);
  rect(width/2,(height/2)+(height/4),100,100);
  button.update();
  oscUse();
  if (oscReceiveData[0]<0.5) {
    sizeNow = sizeOn;
    receiveNow = receiveOn;
  } else {
    sizeNow = sizeOff;
    receiveNow = receiveOff;  
  }
  fill(receiveNow);
  rect((width/4)+(width/2),height/2,sizeNow,sizeNow);
  strokeWeight(20);
  stroke(255);
  pushMatrix();
  ellipseMode(CENTER);
  translate(oscReceiveData[0]*width,abs(height-(oscReceiveData[1]*height)),(oscReceiveData[2]*depth)-(depth/2));
  ellipse(0,0,10,10);
  popMatrix();
}
