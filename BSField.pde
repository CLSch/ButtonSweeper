/* minesweeper field*/

class BSField {
  int tileAmount = 36;
  int mineAmount = 4;
  BSTile tiles[] = new BSTile[tileAmount];
  //int mines[] = new int [4];
  
  BSField() {
    //initialize tiles
    for (int i = 0; i < tileAmount; i++) {
      tiles[i] = new BSTile();
    }
    placeMines();
  }
  
  void placeMines() {
    // place all mines
    for (int i = 0; i < mineAmount; i++) {
      int ran = (int)random(36);
      while (tiles[ran].value == -1) {
        ran = (int)random(36);
      }
      tiles[ran].value = -1;
      placeValues(ran);
    } 
  }
  
  void placeValues(int minePos) {
    //for (int i = 0; i < tileAmount; i++) {
    //  if (tiles[i - 1] != null && tiles[i-1])
    //  tiles[i]
    //}
    
    // add values to tiles 
      
    // tile up 
    if((minePos - 6) >= 0)
      tiles[minePos - 6].value++;
    // tile down
    if((minePos + 6) < 36)
      tiles[minePos + 6].value++;
    // tile right
    if((minePos + 1) % 6 != 0)
      tiles[minePos + 1].value++;
    // tile left
    if(minePos % 6 != 0)
      tiles[minePos - 1].value++;
    // tile diagonal up left
    if((minePos % 6 != 0) && ((minePos - 7) >= 0))
      tiles[minePos - 7].value++;
    // tile diagonal up right
    if(((minePos + 1) % 6 != 0) && ((minePos - 5) >= 0))
      tiles[minePos - 5].value++;
    // tile diagonal down left
    if((minePos % 6 != 0) && ((minePos + 5) < 36))  
      tiles[minePos + 5].value++;
    // tile diagonal down right
    if(((minePos + 1) % 6 != 0) && ((minePos + 7) < 36))
      tiles[minePos + 7].value++;
  }
  
}
