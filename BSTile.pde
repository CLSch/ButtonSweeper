/* minesweeper tile*/

class BSTile{
  float xPos, yPos;
  float diam = 80;
  int value = 0;
  int arPos;
  boolean hasFlag = false;
  boolean isClosed = true;
  boolean selected = false;
  
  BSTile(float _x, float _y, int _arp) {
    xPos = _x;
    yPos = _y;
    arPos = _arp;
  }
}
