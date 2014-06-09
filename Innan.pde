// grid of dots. random lines between dots. a2 and a3 sets amount.

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
int padding = 100;
int oldX = 0;
int oldY = 0;

PImage img;

void setup() {
  // youtube = 16:9
  size(width, height);
  minim = new Minim(this);
  in = minim.getLineIn();
  smooth();
  println(Serial.list());
  arduino = new Arduino(this, Arduino.list()[5], 57600);
  img = loadImage("field.jpeg");
}

void draw() {
  float a0 = (arduino.analogRead(0) / (float) width) * 90f;
  float a1 = (arduino.analogRead(1) / (float) width) * 90f;
  float a2 = (arduino.analogRead(2) / (float) width) * 90f;
  float a3 = (arduino.analogRead(3) / (float) width) * 90f;

  background(0, 0, 0, 50);
  // image(img, 0, 0);
  tint(255, 107);
  

  for (int x=padding; x < (width-padding); x+=20) {
    for (int y=padding; y < (height-padding); y+=20) {
      fill(255);
      
      float randDrawRect = random(255);
      if (randDrawRect < 10+a2) {
        rect(x, y, 2, 2);
        noStroke();
      }

      float r = random(255);

      if (randDrawRect < 10+(a2/2)) {
        stroke(155);
        line(x, y, oldX, oldY);
      }

      float randOld = random(100);
      if (randOld < 5) {
        oldX = x;
        oldY = y;  
      }
    }
  }

  
  // frameRate(30);
  // stroke(255);
  // rectMode(CENTER);
  // fill(200);
  // rect(centerWidth, centerHeight, a2, a2);

  // for(int i = 0; i < width; i++) {
  //   line(i, centerHeight + in.left.get(i)*300, i+1, centerHeight + in.left.get(i+1)*300);
  //   stroke(255);
  // }
}
