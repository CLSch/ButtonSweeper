/* switch panel

   Contains the panel position, height and width and color and four
   button objects.
   
   Makes sure the panel including buttons is drawn on the screen.
   Contains the logic for the execution of panel code.
*/

class SwitchPanel {
  PanelButton[] buttons;
  float xPos = 160;
  float yPos = 650;
  float wWidth = 480;
  float hHeight = 150;
  int cColor = 150;
  
  // initialize panel, create 4 button objects and put them in an array
  SwitchPanel() {
    PanelButton firstB = new PanelButton(215, 700, 1);
    PanelButton secondB = new PanelButton(320, 700, 2);
    PanelButton thirdB = new PanelButton(425, 700, 3);
    PanelButton selectB = new PanelButton(530, 700, 4);
    PanelButton[] buttonsTemp = {firstB, secondB, thirdB, selectB};
    buttons = buttonsTemp;
  }
  
  /* draw the panel with all the buttons */
  void drawPanel() {
    fill(cColor);
    rect(xPos, yPos, wWidth, hHeight);
    
    for (PanelButton but : buttons) {
      but.drawButton();
    }
  }
  
  /* reset all the existing buttons (turn off) */
  void resetButtons() {
    for (PanelButton but : buttons) {
      but.switchOff();
    }
  }
  
  /* execute the 'code' the user wrote on the panel (with buttons) 
     o = on, x = off
     (if valid:)
     ooo = help menu
     oox = move selection up
     oxo = move selection right
     oxx = put/remove flag on tile
     xoo = move selection left
     xox = open selected tile
     xxo = move selection down
     */
  void execute(BSField field) {
    // up, down, left, right change the selected tile
    if (buttons[0].on) {
      if (buttons[1].on) {
        if (buttons[2].on) {
          gameState = 0;
        }
        else {
          // up, oox 
          if (field.checkValidMove(field.tileSelected.arPos, 1)) {
            field.tileSelected.selected = false;
            field.tileSelected = field.tiles[field.tileSelected.arPos - 6];
            field.tileSelected.selected = true; 
          }
        }
      }
      else {
        if (buttons[2].on) {
          // right, oxo
          if (field.checkValidMove(field.tileSelected.arPos, 3)) {
            field.tileSelected.selected = false;
            field.tileSelected = field.tiles[field.tileSelected.arPos + 1];
            field.tileSelected.selected = true; 
          }
        }
        else {
          // flag, oxx
          if (field.tileSelected.hasFlag) {
            field.flags++;
            field.tileSelected.hasFlag = !field.tileSelected.hasFlag;
          }
          else if (field.flags > 0 && field.tileSelected.isClosed) {
            field.flags--;
            field.tileSelected.hasFlag = !field.tileSelected.hasFlag;
          }
        }
      }
    }
    else {
      if (buttons[1].on) {
        if (buttons[2].on) {
          // left, xoo
          if (field.checkValidMove(field.tileSelected.arPos, 7)) {
            field.tileSelected.selected = false;
            field.tileSelected = field.tiles[field.tileSelected.arPos - 1];
            field.tileSelected.selected = true; 
          }
        }
        else {
          //open, xox

          // flag fields can't be opened
          if (field.tileSelected.hasFlag)
            return;
          
          field.tileSelected.isClosed = false;
          field.openTiles++;
        
          // if a tile contains a mine, change to 'game lose state'
          if (field.tileSelected.value == -1) 
            gameState = 2;
          // if a tile has no surrounding mines, open more tiles
          else if (field.tileSelected.value == 0)
            field.emptyField(field.tileSelected.arPos);
          
          // if the tile was the last open tile that wasn't a mine, change to 'game win state'
          if (field.openTiles == 32 && field.tileSelected.value == -1) {
            gameState = 3;
          }
        }
      }
      else {
        if (buttons[2].on) {
          // down, xxo
          if (field.checkValidMove(field.tileSelected.arPos, 5)) {
            field.tileSelected.selected = false;
            field.tileSelected = field.tiles[field.tileSelected.arPos + 6];
            field.tileSelected.selected = true; 
          }
        }
      }
    }
  }
}
