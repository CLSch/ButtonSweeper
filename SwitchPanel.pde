/* switch panel*/

class SwitchPanel {
  PanelButton[] buttons;
  float xPos = 160;
  float yPos = 650;
  float wWidth = 480;
  float hHeight = 150;
  int cColor = 150;
  
  SwitchPanel() {
    //PanelButton helpB = new PanelButton(0, 700, 0);
    PanelButton firstB = new PanelButton(215, 700, 1);
    PanelButton secondB = new PanelButton(320, 700, 2);
    PanelButton thirdB = new PanelButton(425, 700, 3);
    PanelButton selectB = new PanelButton(530, 700, 4);
    PanelButton[] buttonsTemp = {firstB, secondB, thirdB, selectB};
    buttons = buttonsTemp;
  }
  
  void drawPanel() {
    fill(cColor);
    rect(xPos, yPos, wWidth, hHeight);
    
    for (PanelButton but : buttons) {
      but.drawButton();
    }
  }
  
  void resetButtons() {
    for (PanelButton but : buttons) {
      but.switchOff();
    }
  }
  
  void execute(BSField field) {
    //println("TS arpos: " + field.tileSelected.arPos);
    if (buttons[0].on) {
      if (buttons[1].on) {
        if (buttons[2].on) {
          // show help menu
        }
        else {
          // up
          if (field.checkValidMove(field.tileSelected.arPos, 1)) {
            field.tileSelected.selected = false;
            field.tileSelected = field.tiles[field.tileSelected.arPos - 6];
            field.tileSelected.selected = true; 
          }
        }
      }
      else {
        if (buttons[2].on) {
          // right
          if (field.checkValidMove(field.tileSelected.arPos, 3)) {
            field.tileSelected.selected = false;
            field.tileSelected = field.tiles[field.tileSelected.arPos + 1];
            field.tileSelected.selected = true; 
          }
        }
        else {
          // flag
          if (field.tileSelected.hasFlag) {
            field.flags++;
            field.tileSelected.hasFlag = !field.tileSelected.hasFlag;
          }
          else if (field.flags > 0 ) {
            field.flags--;
            field.tileSelected.hasFlag = !field.tileSelected.hasFlag;
          }
        }
      }
    }
    else {
      if (buttons[1].on) {
        if (buttons[2].on) {
          // left
          if (field.checkValidMove(field.tileSelected.arPos, 7)) {
            field.tileSelected.selected = false;
            field.tileSelected = field.tiles[field.tileSelected.arPos - 1];
            field.tileSelected.selected = true; 
          }
        }
        else {
          //click

          // flag fields can't be clicked
          if (field.tileSelected.hasFlag)
            return;
          
          field.tileSelected.isClosed = false;
          field.openTiles++;
        
          if (field.tileSelected.value == -1) 
            gameState = 2;
          else if (field.tileSelected.value == 0)
            field.emptyField(field.tileSelected.arPos);
            
          if (field.openTiles == 32) {
            println("YOU WON");
            gameState = 3;
          }
        }
      }
      else {
        if (buttons[2].on) {
          // down
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
