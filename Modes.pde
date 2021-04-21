final char KEY_ROTATE_RIGHT = ']';
final char KEY_ROTATE_LEFT = '[';
final char KEY_ZOOM_IN = '=';
final char KEY_ZOOM_OUT = '-';
final char KEY_ORTHO_CHANGE = 'o';
final char KEY_TEST_MODE = 't';

final float ANGLE_CHANGE = PI/16; // additive
final float ZOOM_CHANGE = 1.1;    // multiplicative

// if on, draws test pattern. Otherwise, draws your scene
boolean testMode = false;

enum OrthoMode {
  IDENTITY,        // no change. straight to viewport
  CENTER640,       // 0x0 at center, width/height is 640 (+- 320)
  BOTTOMLEFT640,   // 0x0 at bottom left, top right is 640x640
  FLIPX,           // same as CENTER640 but x is flipped
  ASPECT           // uneven aspect ratio: x is < -320 to 320 >, y is <-100 - 100> 
}
OrthoMode orthoMode = OrthoMode.IDENTITY;
final OrthoMode DEFAULT_ORTHO_MODE = OrthoMode.CENTER640; //<>//
