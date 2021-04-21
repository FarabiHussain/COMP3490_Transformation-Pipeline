void drawDesk() {
  drawLeg(true); // front left

  myPush();
  myTranslate(1.7, 0);
  drawLeg(true); // front right
  myPop();

  myPush();
  myScale(0.85);
  myTranslate(1.6, 0);
  drawLeg(false); // back right
  myPop();

  myPush();
  myScale(0.85);
  myTranslate(0.1, 0);
  drawLeg(false); // back left
  myPop();

  myPush();
  myTranslate(0, 0.5);
  drawSurface(); // surface of the desk
  myPop();
}

void drawLamp() { 
  drawBase();

  drawColumn();

  myPush();
  myRotate(0.08);
  drawShade();
  myPop();
}

void drawLaptop() { 
  myPush();
  myTranslate(0, -0.05);
  drawMonitor();
  drawBottom();
  myPop();
}

void drawBottom() {
  drawChassis();

  myPush();
  myScale(0.2);
  myTranslate(0, -1.8);
  drawTouchpad();
  myPop();

  myPush();
  myScale(0.8);
  myTranslate(0, -0.1);
  drawKeyboard();
  myPop();
}

void drawMonitor() {
  myPush();
  myScale(0.66);
  myTranslate(0, 0.535);
  drawBezels();
  myPop();

  myPush();
  myScale(0.67);
  myTranslate(0, 0.62);
  drawScreen();
  myPop();
}

void drawLeg(boolean isFrontLeg) {
  if (isFrontLeg) {
    stroke(0.9, 0.9, 0.9);
    fill(0.9, 0.9, 0.9);
  } else {
    stroke(0.5, 0.5, 0.5);
    fill(0.5, 0.5, 0.5);
  }

  beginShape();
  myVertex(-0.9, -0.2); // left edge
  myVertex(-0.9, -0.98);

  myVertex(-0.88, -0.99); // curved base
  myVertex(-0.86, -0.995);
  myVertex(-0.84, -0.995);
  myVertex(-0.82, -0.99);

  myVertex(-0.8, -0.98); // right edge
  myVertex(-0.8, -0.2);
  endShape();
}

void drawSurface() {
  stroke(0.463, 0.306, 0.188);
  fill(0.463, 0.306, 0.188);

  beginShape(QUADS);
  myVertex(-1, -0.6);
  myVertex(-1, -0.7);   
  myVertex(1, -0.7);
  myVertex(1, -0.6);

  stroke(0.522, 0.345, 0.212);
  fill(0.522, 0.345, 0.212);

  myVertex(1, -0.6);
  myVertex(-1, -0.6); 
  myVertex(-0.7, -0.4);
  myVertex(0.7, -0.4);
  endShape();
}

void drawBase() {
  fill(0.2, 0.2, 0.2);
  stroke(0.19, 0.19, 0.19);

  beginShape(QUADS);
  myVertex(-0.725, -0.5); // lamp base, top surface
  myVertex(-0.5, -0.5);
  myVertex(-0.4, -0.4);  
  myVertex(-0.6, -0.4);

  fill(0.17, 0.17, 0.17);
  stroke(0.17, 0.17, 0.17);

  myVertex(-0.725, -0.5); // lamp base, front edge 
  myVertex(-0.5, -0.5);
  myVertex(-0.5, -0.52);
  myVertex(-0.725, -0.52);

  myVertex(-0.5, -0.5);  // lamp base, right edge
  myVertex(-0.5, -0.52);  
  myVertex(-0.4, -0.42);
  myVertex(-0.4, -0.4);
  endShape();
} 

void drawColumn() {
  fill(0.1, 0.1, 0.1);
  stroke(0.1, 0.1, 0.1);

  beginShape();
  myVertex(-0.57, -0.445); // perpendicular bars
  myVertex(-0.57, -0.025);
  myVertex(-0.53, -0.025);
  myVertex(-0.53, -0.445);

  myVertex(-0.54, -0.450); // curved base
  myVertex(-0.56, -0.450);
  myVertex(-0.57, -0.445);
  endShape();
}

void drawShade() {
  fill(0.5, 0.5, 0.5);
  stroke(0.5, 0.5, 0.5);

  beginShape(QUADS);
  myVertex(-0.8, -0.025); // front surface
  myVertex(-0.4, -0.025);
  myVertex(-0.47, 0.225);
  myVertex(-0.72, 0.225);

  fill(0.45, 0.45, 0.45);
  stroke(0.45, 0.45, 0.45);

  myVertex(-0.4, -0.025); // right surface
  myVertex(-0.47, 0.225);
  myVertex(-0.4, 0.255);
  myVertex(-0.3, 0.04);

  fill(0.35, 0.35, 0.35);
  stroke(0.35, 0.35, 0.35);

  myVertex(-0.72, 0.225); // gap on the top
  myVertex(-0.47, 0.225);
  myVertex(-0.4, 0.255);
  myVertex(-0.6, 0.255);
  endShape();
}

void drawChassis() {
  stroke(0.78, 0.78, 0.78);
  fill(0.78, 0.78, 0.78);

  beginShape(QUAD);
  myVertex(-0.4, -0.3);
  myVertex(0.4, -0.3);
  myVertex(0.6, -0.5);
  myVertex(-0.6, -0.5);
  endShape();

  stroke(0.62, 0.62, 0.62);
  fill(0.62, 0.62, 0.62);

  beginShape(QUAD);
  myVertex(0.6, -0.5);
  myVertex(-0.6, -0.5);
  myVertex(-0.6, -0.53);
  myVertex(0.6, -0.53);
  endShape();
}

void drawKeyboard() {
  stroke(0.62, 0.62, 0.62);
  fill(0.62, 0.62, 0.62);

  beginShape(QUAD);
  myVertex(-0.5, -0.3);
  myVertex(0.5, -0.3);
  myVertex(0.6, -0.4);
  myVertex(-0.6, -0.4);
  endShape();
}

void drawTouchpad() {
  stroke(0.62, 0.62, 0.62);
  fill(0.62, 0.62, 0.62);

  beginShape(QUAD);
  myVertex(-0.5, -0.3);
  myVertex(0.5, -0.3);
  myVertex(0.6, -0.5);
  myVertex(-0.6, -0.5);
  endShape();
}

void drawBezels() {
  stroke(0.62, 0.62, 0.62);
  fill(0.62, 0.62, 0.62);

  beginShape(QUAD);
  myVertex(-0.6, -0.2);
  myVertex(0.6, -0.2);
  myVertex(0.6, -0.99);
  myVertex(-0.6, -0.99);
  endShape();
}

void drawScreen() {
  stroke(0.08, 0.08, 0.08);
  fill(0.08, 0.08, 0.08);

  beginShape(QUAD);
  myVertex(-0.58, -0.3);
  myVertex(0.58, -0.3);
  myVertex(0.58, -0.99);
  myVertex(-0.58, -0.99);
  endShape();
}
