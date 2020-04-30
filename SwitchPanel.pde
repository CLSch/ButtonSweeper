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
  
  void execute(BSField field) {
    if (buttons[0].on) {
      if (buttons[1].on) {
        if (buttons[2].on) {
          // show help menu
        }
        else {
          field.tileSelected
          // down
        }
      else {
        if (buttons[2].on) {
          // right
        }
        else {
          // flag
        }
      }
    }
    else {
      if (buttons[1].on) {
        if (buttons[2].on) {
          // left
        }
        else {
          // click
        }
      else {
        if (buttons[2].on) {
          // up
        }
      }
    }
  }
  
  //PanelButton getAnswerButton() {
  //  return buttons[5];
  //}
}
