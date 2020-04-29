/* minesweeper tile*/

class BSTile{
  int value;
  boolean hasFlag = false;
  boolean isClosed = true;
  //boolean isMine = false;
  
  BSTile() {
    value = 0;
  }
}

// value = 0 if no other tiles are near
// value = 1-6 amount of mine
// value = -1 if bomb
