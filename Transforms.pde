final char KEY_PANNING = 'p';
boolean panningEnabled = true;

float zoom = 1;
float angle = 0;

PMatrix3D modelMatrix = getModel();
PMatrix3D camera;
PMatrix3D push;

PVector up = new PVector(0, 1, 0);
PVector centre = new PVector(0, 0, 0);

// =========================================================
// Methods
// =========================================================

void myVertex(PVector vert) {
  _myVertex(vert.x, vert.y, false);
}

void myVertex(float x, float y) {
  _myVertex(x, y, false);
}

void myVertex(float x, float y, boolean debug) {
  _myVertex(x, y, debug);
}

// =========================================================
// Task 1 & 2
// =========================================================

void _myVertex(float x, float y, boolean debug) {
  PVector p = new  PVector(x, y, 1);

  modelMatrix.mult(p, p);
  getCamera(up, centre, zoom).mult(p, p);
  getOrtho(-width/2, width/2, -height/2, height/2).mult(p, p);
  getViewPort().mult(p, p);

  if (debug) println(nf((int)x, 3, 0) + " " + nf((int)y, 3, 0) + " --> " + (int)p.x + " " + (int)p.y);

  vertex(p.x, p.y);
}

PMatrix3D getViewPort() {
  return new PMatrix3D(
    width/2, 0, width/2, 0, 
    0, -height/2, height/2, 0, 
    0, 0, 1, 0, 
    0, 0, 0, 1);
}

PMatrix3D getOrtho(float left, float right, float bottom, float top) {
  if (orthoMode != OrthoMode.IDENTITY) {
    if (orthoMode == OrthoMode.BOTTOMLEFT640) {
      left = 0;
      right = width; 
      top = height;
      bottom = 0;
    } else if (orthoMode == OrthoMode.FLIPX) {
      left = -left;
      right = -right;
    } else if (orthoMode == OrthoMode.ASPECT) {
      top = 100;
      bottom = -100;
    }

    return new PMatrix3D(
      2/(right-left), 0, -(right+left)/(right-left), 0, 
      0, 2/(top-bottom), -(top+bottom)/(top-bottom), 0, 
      0, 0, 1, 0, 
      0, 0, 0, 1);
  } else {
    return new PMatrix3D();
  }
}

PMatrix3D getCamera(PVector up, PVector centre, float zoom) {
  up = new PVector (cos(angle)*up.x - sin(angle)*up.y, sin(angle)*up.x + cos(angle)*up.y, 1);

  camera = new PMatrix3D();

  if (panningEnabled) {
    if (orthoMode == OrthoMode.FLIPX) {
      camera.set(new float[]{
        1, 0, (2*mouseX-width)/zoom, 0, 
        0, 1, (2*mouseY-height)/zoom, 0, 
        0, 0, 1, 0, 
        0, 0, 0, 1});
    } else if (orthoMode == OrthoMode.IDENTITY) {
      camera.set(new float[]{
        1, 0, ((-2*mouseX+width)/zoom)*0.00001, 0, 
        0, 1, ((2*mouseY-height)/zoom)*0.00001, 0, 
        0, 0, 1, 0, 
        0, 0, 0, 1});
    } else {
      camera.set(new float[]{
        1, 0, (-2*mouseX+width)/zoom, 0, 
        0, 1, (2*mouseY-height)/zoom, 0, 
        0, 0, 1, 0, 
        0, 0, 0, 1});
    }
  }

  PMatrix3D basis = new PMatrix3D(
    up.y, -up.x, 0, 0, 
    up.x, up.y, 0, 0, 
    0, 0, 1, 0, 
    0, 0, 0, 1); 

  camera.apply(basis);
  camera.apply(getScaleMatrix(zoom));
  camera.apply(getTranslationMatrix(centre.x, centre.y));

  return camera;
}

PMatrix3D getModel() {
  return new PMatrix3D();
}

// =========================================================
// Task 3
// =========================================================

void myPush() {  
  push = new PMatrix3D(modelMatrix);
  matrixStack.push(push);
}

void myPop() {
  modelMatrix = matrixStack.pop();
}

void myRotate(float theta) {
  modelMatrix.apply(getRotationMatrix(theta));
}

void myScale (float s) {
  modelMatrix.apply(getScaleMatrix(s));
}

void myTranslate(float tx, float ty) {
  modelMatrix.apply(getTranslationMatrix(-tx, -ty));
}

// =========================================================
// whatever these are called lol
// =========================================================

PMatrix3D getTranslationMatrix(float tx, float ty) {
  return new PMatrix3D(
    1, 0, -tx, 0, 
    0, 1, -ty, 0, 
    0, 0, 1, 0, 
    0, 0, 0, 1);
}

PMatrix3D getScaleMatrix(float s) { 
  return new PMatrix3D(
    s, 0, 0, 0, 
    0, s, 0, 0, 
    0, 0, 1, 0, 
    0, 0, 0, 1);
}

PMatrix3D getRotationMatrix(float angle) {
  return new PMatrix3D(
    cos(angle), -sin(angle), 0, 0, 
    sin(angle), cos(angle), 0, 0, 
    0, 0, 1, 0, 
    0, 0, 0, 1);
}

void keyPressed() {
  if (key == KEY_ZOOM_OUT) zoom *= 1/ZOOM_CHANGE;
  else if (key == KEY_ZOOM_IN) zoom *= ZOOM_CHANGE;
  else if (key == KEY_ROTATE_RIGHT) angle += ANGLE_CHANGE;
  else if (key == KEY_ROTATE_LEFT) angle -= ANGLE_CHANGE;
  else if (key == KEY_PANNING) panningEnabled = !panningEnabled; 
  else if (key == KEY_TEST_MODE) testMode = !testMode;
  else if (key == KEY_ORTHO_CHANGE) {
    if (orthoMode == OrthoMode.IDENTITY) orthoMode = OrthoMode.CENTER640; 
    else if (orthoMode == OrthoMode.CENTER640) orthoMode = OrthoMode.BOTTOMLEFT640;
    else if (orthoMode == OrthoMode.BOTTOMLEFT640) orthoMode = OrthoMode.FLIPX;
    else if (orthoMode == OrthoMode.FLIPX) orthoMode = OrthoMode.ASPECT;
    else if (orthoMode == OrthoMode.ASPECT) orthoMode = OrthoMode.IDENTITY;
  }
  println("ZOOM " + nf(zoom * 100, 0, 4) + "%\t ANGLE " + nf(angle*180/PI, 0, 2) + "\t PANNING " + panningEnabled + "\t TESTMODE " + testMode + "\t ORTHOMODE " + orthoMode);
}

void mousePressed() {
  PVector mouseCoords = new PVector(mouseX, mouseY, 1);
  getCamera(up, centre, zoom).mult(mouseCoords, mouseCoords);
  getOrtho(-width/2, width/2, -height/2, height/2).mult(mouseCoords, mouseCoords);
  getViewPort().mult(mouseCoords, mouseCoords);
  println(mouseCoords);
}
