/* minesweeper field*/

class BSField {
  final int NUMTILES = 36;
  final int NUMMINES = 4;
  BSTile tiles[] = new BSTile[NUMTILES];
  BSTile tileSelected;
  //int mines[] = new int [4];
  
  BSField() {
    //initialize tiles
    int tileCounter = 0;
    for(float y = 70; y < 550 ; y+= 80) {
      for(float x = 160; x < 640; x+= 80) {
        tiles[tileCounter] = new BSTile(x, y);
        tileCounter++;
      }
    }
    
    placeMines();
    // put selection on first tile
    tileSelected = tiles[0];
    tileSelected.selected = true;
  }
  
  void placeMines() {
    // place all mines
    for (int i = 0; i < NUMMINES; i++) {
      int ran = (int)random(36);
      while (tiles[ran].value == -1) {
        ran = (int)random(36);
      }
      tiles[ran].value = -1;
      placeValues(ran);
    } 
  }
  
  //void checkValidMove() {
  //  if(((minePos - 6) >= 0) && (tiles[minePos - 6].value != -1))
  //    tiles[minePos - 6].value++;
  //  // tile down
  //  if(((minePos + 6) < 36) && (tiles[minePos + 6].value != -1))
  //    tiles[minePos + 6].value++;
  //  // tile right
  //  if(((minePos + 1) % 6 != 0) && (tiles[minePos + 1].value != -1))
  //    tiles[minePos + 1].value++;
  //  // tile left
  //  if((minePos % 6 != 0) && (tiles[minePos - 1].value != -1))
  //    tiles[minePos - 1].value++;
  //  // tile diagonal up left
  //  if((minePos % 6 != 0) && ((minePos - 7) >= 0) && (tiles[minePos - 7].value != -1))
  //    tiles[minePos - 7].value++;
  //  // tile diagonal up right
  //  if(((minePos + 1) % 6 != 0) && ((minePos - 5) >= 0) && (tiles[minePos - 5].value != -1))
  //    tiles[minePos - 5].value++;
  //  // tile diagonal down left
  //  if((minePos % 6 != 0) && ((minePos + 5) < 36) && (tiles[minePos + 5].value != -1))  
  //    tiles[minePos + 5].value++;
  //  // tile diagonal down right
  //  if(((minePos + 1) % 6 != 0) && ((minePos + 7) < 36) && (tiles[minePos + 7].value != -1))
  //    tiles[minePos + 7].value++;
  //}
  
  
  void placeValues(int minePos) {
    //for (int i = 0; i < tileAmount; i++) {
    //  if (tiles[i - 1] != null && tiles[i-1])
    //  tiles[i]
    //}
    
    // add values to tiles 
    
        
    // tile up 
    if(((minePos - 6) >= 0) && (tiles[minePos - 6].value != -1))
      tiles[minePos - 6].value++;
    // tile down
    if(((minePos + 6) < 36) && (tiles[minePos + 6].value != -1))
      tiles[minePos + 6].value++;
    // tile right
    if(((minePos + 1) % 6 != 0) && (tiles[minePos + 1].value != -1))
      tiles[minePos + 1].value++;
    // tile left
    if((minePos % 6 != 0) && (tiles[minePos - 1].value != -1))
      tiles[minePos - 1].value++;
    // tile diagonal up left
    if((minePos % 6 != 0) && ((minePos - 7) >= 0) && (tiles[minePos - 7].value != -1))
      tiles[minePos - 7].value++;
    // tile diagonal up right
    if(((minePos + 1) % 6 != 0) && ((minePos - 5) >= 0) && (tiles[minePos - 5].value != -1))
      tiles[minePos - 5].value++;
    // tile diagonal down left
    if((minePos % 6 != 0) && ((minePos + 5) < 36) && (tiles[minePos + 5].value != -1))  
      tiles[minePos + 5].value++;
    // tile diagonal down right
    if(((minePos + 1) % 6 != 0) && ((minePos + 7) < 36) && (tiles[minePos + 7].value != -1))
      tiles[minePos + 7].value++;
  }
  
  void emptyField(int tilePos){
    // tile up 
    if(((tilePos - 6) >= 0) && tiles[tilePos - 6].isClosed) {
      tiles[tilePos - 6].isClosed = false;
      if (tiles[tilePos - 6].value == 0)
        emptyField(tilePos - 6);
    }
    // tile down
    if(((tilePos + 6) < 36) && tiles[tilePos + 6].isClosed) {
      tiles[tilePos + 6].isClosed = false;
      if (tiles[tilePos + 6].value == 0)
        emptyField(tilePos + 6);
    }
    
    // tile right
    if(((tilePos + 1) % 6 != 0) && tiles[tilePos + 1].isClosed) {
      tiles[tilePos + 1].isClosed = false;
      if (tiles[tilePos + 1].value == 0)
        emptyField(tilePos + 1);
    }
    
    // tile left
    if((tilePos % 6 != 0) && tiles[tilePos - 1].isClosed) {
      tiles[tilePos - 1].isClosed = false;
      if (tiles[tilePos - 1].value == 0)
        emptyField(tilePos - 1);
    }
    
    // tile diagonal up left
    if((tilePos % 6 != 0) && ((tilePos - 7) >= 0) && tiles[tilePos - 7].isClosed) {
      tiles[tilePos - 7].isClosed = false;
      if (tiles[tilePos - 7].value == 0)
        emptyField(tilePos - 7);
    }
    
    // tile diagonal up right
    if(((tilePos + 1) % 6 != 0) && ((tilePos - 5) >= 0) && tiles[tilePos - 5].isClosed) {
      tiles[tilePos - 5].isClosed = false;
      if (tiles[tilePos - 5].value == 0)
        emptyField(tilePos - 5);
    }
    
    // tile diagonal down left
    if((tilePos % 6 != 0) && ((tilePos + 5) < 36) && tiles[tilePos + 5].isClosed) {
      tiles[tilePos + 5].isClosed = false;
      if (tiles[tilePos + 5].value == 0)
        emptyField(tilePos + 5);
    }
    
    // tile diagonal down right
    if(((tilePos + 1) % 6 != 0) && ((tilePos + 7) < 36) && tiles[tilePos + 7].isClosed){
      tiles[tilePos + 7].isClosed = false;
      if (tiles[tilePos + 7].value == 0)
        emptyField(tilePos + 7);
    }
  }
  
  void drawField() {
    for (BSTile tile : tiles) {
      fill(200);
      stroke(0);
      strokeWeight(1);
      rect(tile.xPos, tile.yPos, tile.diam, tile.diam);
      if (!tile.isClosed) {
        fill(150);
        rect(tile.xPos, tile.yPos, tile.diam, tile.diam);
        if (tile.value == -1) {
          image(mineImg, tile.xPos, tile.yPos, tile.diam, tile.diam);
        }
        else if (tile.value > 0) {
          fill(255);
          textSize(50);
          // why this x and y???
          text(str(tile.value), tile.xPos+25, tile.yPos+60);
        }
      }
       // draw selection
      if (tile.selected) {
      strokeWeight(5);
      stroke(255, 0, 0);
      // make transparant
      noFill();
      // make sure stroke is insight square
      rect(tile.xPos + 3, tile.yPos + 3, tile.diam - 5, tile.diam - 5);
      }
    }
  }
}
