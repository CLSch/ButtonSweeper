/* panel buttons

  panel buttons have a unique id, color (depending on their state), state (on/off),
  position and diameter
*/

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
  }
  
  /* draw a button that's red when on and black when off*/
  void drawButton() {
    fill(redVal, 0, 0);
    rect(xPos, yPos, diam, diam);
  }
  
  /* change redVal to red or black depending on current state*/
  void toggle() {
    redVal = 0;
    
    if (!on)
      redVal = 255;
         
    on = !on;
  }
  
  /* useful for resetting, turn button off and make the button black */
  void switchOff() {
    redVal = 0;
    on = false;
  }
}
