Eurorack-Processing
===================

import org.firmata.*;
import cc.arduino.*;
import processing.serial.*;
import cc.arduino.*;
import ddf.minim.*;

Arduino arduino;

// minim
Minim minim;
AudioInput in;

int width = 800;
int height = 450;
int centerWidth = width / 2;
int centerHeight = height / 2;
int padding = 120;

void setup() {
  // youtube = 16:9
  size(width, height);
  minim = new Minim(this);
  in = minim.getLineIn();
  smooth();
  println(Serial.list());
  arduino = new Arduino(this, Arduino.list()[5], 57600);
}

void draw() {
  float a0 = (arduino.analogRead(0) / (float) width) * 90f;
  float a1 = (arduino.analogRead(1) / (float) width) * 90f;
  float a2 = (arduino.analogRead(2) / (float) width) * 90f;
  float a3 = (arduino.analogRead(3) / (float) width) * 90f;
  background(a3);
  frameRate(30);
  stroke(255);
  rectMode(CENTER);
  fill(200);
  rect(centerWidth, centerHeight, a2, a2);

  for(int i = 0; i < width; i++) {
    line(i, centerHeight + in.left.get(i)*300, i+1, centerHeight + in.left.get(i+1)*300);
    stroke(255);
  }
}
