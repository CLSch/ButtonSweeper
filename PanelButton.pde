/* panel buttons*/

class PanelButton {
  int id;
  int redVal = 0;
  float xPos, yPos;
  float diam = 50;
  boolean on = false;
  
  PanelButton(float _x, float _y, int _id) {
    xPos = _x;
    yPos = _y; 
    id = _id;
    //initType();
  }
  
  void drawButton() {
    fill(redVal, 0, 0);
    rect(xPos, yPos, diam, diam);
  }
  
  void toggle() {
    redVal = 0;
    
    if (!on)
      redVal = 255;
         
    on = !on;
  }
  
  void switchOff() {
    redVal = 0;
    on = false;
  }
  
  //void initType() {
  //  if (reds == 255 && greens == 255 && blues == 255) 
  //    isHelp = true;
  //  else if (reds == 30 && greens == 30 && blues == 30)
  //    isSelect = true;
  //  else if (reds == 150 && greens == 150 && blues == 150)
  //    isAnswer = true;
  //    isEmpty = true;
  //}
}
