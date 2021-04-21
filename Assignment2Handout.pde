import java.util.Stack;

// use to implement your model matrix stack
Stack<PMatrix3D> matrixStack = new Stack<PMatrix3D>();

// called once, at the start of our program
void setup() {
  size(640, 640);
  colorMode(RGB, 1.0f);
}

// called roughly 60 times per second
void draw() {
  clear();
  stroke(1, 1, 1);

  if (testMode) {
    drawTest(1000);
    drawTest(100);
    drawTest(1);
  } else {
    drawScene();
  }
}

void drawScene() {
  myPush();
  myScale(300);
  drawDesk();
  myPop();

  myPush();
  myScale(300);
  myTranslate(0, 0.52);
  drawLamp();
  myPop();

  myPush();
  myScale(200);
  myTranslate(0, 0.5);
  drawLaptop();
  myPop();
}
