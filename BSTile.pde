/* minesweeper tile*/

class BSTile{
  float xPos, yPos;
  float diam = 80;
  int value = 0;
  boolean hasFlag = false;
  boolean isClosed = true;
  boolean selected = false;
  
  BSTile(float _x, float _y) {
    xPos = _x;
    yPos = _y;
  }
}

// value = 0 if no other tiles are near
// value = 1-6 amount of mine
// value = -1 if bomb
