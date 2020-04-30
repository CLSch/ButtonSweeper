/* switch panel*/

class SwitchPanel {
  PanelButton[] buttons;
  float xPos = 240;
  float yPos = 600;
  float wWidth = 320;
  float hHeight = 250;
  int cColor = 150;
  
  SwitchPanel() {
    PanelButton whiteB = new PanelButton(255, 255, 255, 260, 620);
    PanelButton blackB = new PanelButton(30, 30, 30, 490, 780);
    PanelButton redB = new PanelButton(255, 0, 0, 260, 700);
    PanelButton yellowB = new PanelButton(255, 255, 0, 330, 700);
    PanelButton blueB = new PanelButton(0, 0, 255, 400, 700);
    PanelButton answerB = new PanelButton(150, 150, 150, 260, 780);
    PanelButton[] buttonsTemp = {whiteB, redB, yellowB, blueB, answerB, blackB};
    buttons = buttonsTemp;
  }
  
  void drawPanel() {
    fill(cColor);
    rect(xPos, yPos, wWidth, hHeight);
    
    for (PanelButton but : buttons) {
      but.drawButton();
    }
  }
  
  PanelButton getAnswerButton() {
    return buttons[5];
  }
}
