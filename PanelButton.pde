/* panel buttons*/

class PanelButton {
  int reds, greens, blues;
  float xPos, yPos;
  float diam = 50;
  boolean isHelp = false;
  boolean isSelect = false;
  boolean isAnswer = false;
  boolean isEmpty = false;
  
  PanelButton(int _r, int _g, int _b, float _x, float _y) {
    reds = _r;
    greens = _g;
    blues = _b;
    xPos = _x;
    yPos = _y; 
    
    initType();
  }
  
  void drawButton() {
    fill(reds, greens, blues);
    rect(xPos, yPos, diam, diam);
  }
  
  void setRGB(int r, int g, int b) {
    reds = r;
    greens = g;
    blues = b;
  }
  
  void initType() {
    if (reds == 255 && greens == 255 && blues == 255) 
      isHelp = true;
    else if (reds == 30 && greens == 30 && blues == 30)
      isSelect = true;
    else if (reds == 150 && greens == 150 && blues == 150)
      isAnswer = true;
      isEmpty = true;
  }
}
