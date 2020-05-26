/* minesweeper tile

Contains information on the tile like position x and y and position in the array,
diameter of tile, value amount of mines that surrounf the tile or -1 if tile is a mine, 
if the tile has a flag, is open and if it is selected.
*/

class BSTile{
  float xPos, yPos;
  float diam = 80;
  // value: -1 = mine, 0 - 4 show amount of surrounding mines
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
