/* minesweeper field

 Does all the calculations on the field and contains 36 BSTile objects.
 
 Initialises minesweeper field and draws the field.
 Contains logic for checking validity of user execution code and 

*/

class BSField {
  final int NUMTILES = 36;
  final int NUMMINES = 4;
  BSTile tiles[] = new BSTile[NUMTILES];
  BSTile tileSelected;
  int flags = 4;
  int openTiles = 0;
  
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
  
  /* Randomly place 4 mines in the field */
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
  
  /* Reset the field and create 4 new mines */
  void resetField() {
    for (BSTile tile : tiles) {
      tile.value = 0;
      tile.hasFlag = false;
      tile.isClosed = true;
      tile.selected = false;
    }
    placeMines();
    // put selection on first tile
    tileSelected = tiles[0];
    tileSelected.selected = true;
    
    flags = 4;
    openTiles = 0;
  }
  
  /* Helper function for placing values and opening empty fields, to see which tiles surround a selected tile.
  direction: 0 = up left, 1 = up 2 = up right, 3 = right, 4 = right bottom, 5 = bottom, 6 = bottom left, 7 = left */
  boolean checkValidMove(int tilePos, int direction) {
    // tile left up
    if (direction == 0) {
      if ((tilePos % 6 != 0) && ((tilePos - 7) >= 0))
        return true;
    }
    // tile up
    if (direction == 1) {
      if ((tilePos - 6) >= 0)
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
      if ((tilePos + 6) < 36) {
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
    // if tile doesn't exist
    return false;
  }
  
  /* Increment the value of all tiles surrounding a mine
  is used for the initialisation of the field */
  void placeValues(int minePos) {   
    // tile down 
    if((checkValidMove(minePos, 1)) && (tiles[minePos - 6].value != -1))
      tiles[minePos - 6].value++;
    // tile up
    if((checkValidMove(minePos, 5)) && (tiles[minePos + 6].value != -1))
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
  
  /* If a field that has no mines next to it, open it and do the same thing for the 
  surrounding fields. If every empty field has open surrounding tiles, stop. 
  input is the starting tile position (0 - 35)*/
  void emptyField(int tilePos){
    // tile up 
    if(checkValidMove(tilePos, 1) && tiles[tilePos - 6].isClosed) {
      tiles[tilePos - 6].isClosed = false;
      openTiles++;
      if (tiles[tilePos - 6].value == 0)
        emptyField(tilePos - 6);
    }
    // tile down
    if(checkValidMove(tilePos, 5) && tiles[tilePos + 6].isClosed) {
      tiles[tilePos + 6].isClosed = false;
      openTiles++;
      if (tiles[tilePos + 6].value == 0)
        emptyField(tilePos + 6);
    }
    
    // tile right
    if(checkValidMove(tilePos, 3) && tiles[tilePos + 1].isClosed) {
      tiles[tilePos + 1].isClosed = false;
      openTiles++;
      if (tiles[tilePos + 1].value == 0)
        emptyField(tilePos + 1);
    }
    
    // tile left
    if(checkValidMove(tilePos, 7) && tiles[tilePos - 1].isClosed) {
      tiles[tilePos - 1].isClosed = false;
      openTiles++;
      if (tiles[tilePos - 1].value == 0)
        emptyField(tilePos - 1);
    }
    
    // tile diagonal up left
    if(checkValidMove(tilePos, 0) && tiles[tilePos - 7].isClosed) {
      tiles[tilePos - 7].isClosed = false;
      openTiles++;
      if (tiles[tilePos - 7].value == 0)
        emptyField(tilePos - 7);
    }
    
    // tile diagonal up right
    if(checkValidMove(tilePos, 2) && tiles[tilePos - 5].isClosed) {
      tiles[tilePos - 5].isClosed = false;
      openTiles++;
      if (tiles[tilePos - 5].value == 0)
        emptyField(tilePos - 5);
    }
    
    // tile diagonal down left
    if(checkValidMove(tilePos, 6) && tiles[tilePos + 5].isClosed) {
      tiles[tilePos + 5].isClosed = false;
      openTiles++;
      if (tiles[tilePos + 5].value == 0)
        emptyField(tilePos + 5);
    }
    
    // tile diagonal down right
    if(checkValidMove(tilePos, 4) && tiles[tilePos + 7].isClosed){
      tiles[tilePos + 7].isClosed = false;
      openTiles++;
      if (tiles[tilePos + 7].value == 0)
        emptyField(tilePos + 7);
    }
  }
  
  /* Draw the field*/
  void drawField() {
    
    // show amount of flags on screen
    fill(200);
    rect(160,30,80,40);
    image(flagImg, 160, 30, 40, 40);
    fill(50);
    textSize(35);
    text(str(flags), 210, 65);
    
    // show amount of mines on screen
    fill(200);
    rect(560,30,80,40);
    image(mineImg, 560, 30, 40, 40);
    fill(50);
    textSize(25);
    text("x4", 605, 60);
    
    
    for (BSTile tile : tiles) {
      fill(200);
      stroke(0);
      strokeWeight(1);
      rect(tile.xPos, tile.yPos, tile.diam, tile.diam);
      
      // draw a flag on a tile
      if (tile.isClosed && tile.hasFlag)
        image(flagImg, tile.xPos, tile.yPos, tile.diam, tile.diam);
      
      // draw open tile with the right number or draw mine
      if (!tile.isClosed) {
        fill(150);
        rect(tile.xPos, tile.yPos, tile.diam, tile.diam);
        // mine
        if (tile.value == -1) {
          image(mineImg, tile.xPos, tile.yPos, tile.diam, tile.diam);
        }
        // draw number
        else if (tile.value > 0) {
          fill(255);
          textSize(50);
          // x and y are approx. middle of tile
          text(str(tile.value), tile.xPos+25, tile.yPos+60);
        }
      }
       // selection tile
      if (tile.selected) {
      strokeWeight(5);
      stroke(255, 0, 0);
      
      noFill();
      // make sure stroke is inside square
      rect(tile.xPos + 3, tile.yPos + 3, tile.diam - 5, tile.diam - 5);
      
      // make sure stroke is back to default values for other draw functions
      fill(200);
      stroke(0);
      strokeWeight(1);      
      }
    }
  }
}
