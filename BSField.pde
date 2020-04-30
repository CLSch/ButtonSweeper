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
        tiles[tileCounter] = new BSTile(x, y, tileCounter);
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
  
  // direction: 0 = up left, 1 = up 2 = up right, 3 = right, 4 = right bottom, 5 = bottom, 6 = bottom left, 7 = left
  boolean checkValidMove(int tilePos, int direction) {
    // tile left up
    if (direction == 0) {
      if ((tilePos % 6 != 0) && ((tilePos - 7) >= 0))
        return true;
    }
    // tile up
    if (direction == 1) {
      if ((tilePos + 6) < 36)
        return true;
    }
    // tile right up
    if (direction == 2) {
      if (((tilePos + 1) % 6 != 0) && ((tilePos - 5) >= 0))
        return true;
    }
    // tile right
    if (direction == 3) {
      if ((tilePos + 1) % 6 != 0)
        return true;
    }
    // tile right down
    if (direction == 4) {
      if (((tilePos + 1) % 6 != 0) && ((tilePos + 7) < 36))
        return true;
    }
    // tile down
    if (direction == 5) {
      if ((tilePos - 6) >= 0) {
        println("tilePos: " + tilePos);
        println("in down");
        return true;
      }
    }
    // tile left down
    if (direction == 6) {
      if ((tilePos % 6 != 0) && ((tilePos + 5) < 36))
        return true;
    }
    // tile left
    if (direction == 7) {
      if (tilePos % 6 != 0)
        return true;
    }
    return false;
  }
  
  
  void placeValues(int minePos) {
    // add values to tiles 
        
    // tile down 
    if((checkValidMove(minePos, 5)) && (tiles[minePos - 6].value != -1))
      tiles[minePos - 6].value++;
    // tile up
    if((checkValidMove(minePos, 1)) && (tiles[minePos + 6].value != -1))
      tiles[minePos + 6].value++;
    // tile right
    if((checkValidMove(minePos, 3)) && (tiles[minePos + 1].value != -1))
      tiles[minePos + 1].value++;
    // tile left
    if((checkValidMove(minePos, 7)) && (tiles[minePos - 1].value != -1))
      tiles[minePos - 1].value++;
    // tile diagonal up left
    if((checkValidMove(minePos, 0)) && (tiles[minePos - 7].value != -1))
      tiles[minePos - 7].value++;
    // tile diagonal up right
    if((checkValidMove(minePos, 2)) && (tiles[minePos - 5].value != -1))
      tiles[minePos - 5].value++;
    // tile diagonal down left
    if((checkValidMove(minePos, 6)) && (tiles[minePos + 5].value != -1))  
      tiles[minePos + 5].value++;
    // tile diagonal down right
    if((checkValidMove(minePos, 4)) && (tiles[minePos + 7].value != -1))
      tiles[minePos + 7].value++;
  }
  
  void emptyField(int tilePos){
    // tile up 
    if(checkValidMove(tilePos, 1) && tiles[tilePos - 6].isClosed) {
      tiles[tilePos - 6].isClosed = false;
      if (tiles[tilePos - 6].value == 0)
        emptyField(tilePos - 6);
    }
    // tile down
    if(checkValidMove(tilePos, 5) && tiles[tilePos + 6].isClosed) {
      tiles[tilePos + 6].isClosed = false;
      if (tiles[tilePos + 6].value == 0)
        emptyField(tilePos + 6);
    }
    
    // tile right
    if(checkValidMove(tilePos, 3) && tiles[tilePos + 1].isClosed) {
      tiles[tilePos + 1].isClosed = false;
      if (tiles[tilePos + 1].value == 0)
        emptyField(tilePos + 1);
    }
    
    // tile left
    if(checkValidMove(tilePos, 7) && tiles[tilePos - 1].isClosed) {
      tiles[tilePos - 1].isClosed = false;
      if (tiles[tilePos - 1].value == 0)
        emptyField(tilePos - 1);
    }
    
    // tile diagonal up left
    if(checkValidMove(tilePos, 0) && tiles[tilePos - 7].isClosed) {
      tiles[tilePos - 7].isClosed = false;
      if (tiles[tilePos - 7].value == 0)
        emptyField(tilePos - 7);
    }
    
    // tile diagonal up right
    if(checkValidMove(tilePos, 2) && tiles[tilePos - 5].isClosed) {
      tiles[tilePos - 5].isClosed = false;
      if (tiles[tilePos - 5].value == 0)
        emptyField(tilePos - 5);
    }
    
    // tile diagonal down left
    if(checkValidMove(tilePos, 6) && tiles[tilePos + 5].isClosed) {
      tiles[tilePos + 5].isClosed = false;
      if (tiles[tilePos + 5].value == 0)
        emptyField(tilePos + 5);
    }
    
    // tile diagonal down right
    if(checkValidMove(tilePos, 4) && tiles[tilePos + 7].isClosed){
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
