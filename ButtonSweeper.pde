/*main
minesweeper*/

BSField field;
SwitchPanel panel;
PImage mineImg;
PImage flagImg;
int gameState;
int startTime;
boolean gamePause;
int test = 0;
boolean firstTime = true;
boolean blink = false;

void setup() {
  
  size(800,900);
  field = new BSField();
  panel = new SwitchPanel();
  gameState = 0;
  mineImg = loadImage("bomb.png");
  flagImg = loadImage("flag.png");
  startTime = millis();
}

void draw() {
  background(50);
  if (gameState == 0)
    //drawHelp();
    drawWin();
  else if (gameState == 1)
    drawGame();
  else if (gameState == 2)
    drawLose();
  else if (gameState == 3)
    drawWin();
}

void drawHelp() {
  //gameState++;
  gamePause = true;
  
  fill(80);
  rect(160, 70, 480, 480);
  panel.drawPanel();
  
  if (startTime + 700 < millis()) {
    startTime = millis();
    panel.buttons[3].toggle();
  }
}

void drawGame() {
  gamePause = false;
  field.drawField();
  panel.drawPanel();
}

void drawLose() {
  // draw cross
  // laat selectie button knipperen?
  // selectie is nieuw spel reset alles
  // gameState = 1
  gamePause = true;
  field.drawField();
  panel.drawPanel();
  
  if (startTime + 700 < millis()) {
    startTime = millis();
    panel.buttons[3].toggle();
  }
}

void drawWin() {
  gamePause = true;
  field.drawField();
  panel.drawPanel();
  if (firstTime){
    panel.buttons[test].toggle();
    firstTime = false;
  }
  if (!blink && startTime + 100 < millis()) {   
    if (test < 11) {
      panel.buttons[test%4].toggle();
      panel.buttons[(test+1)%4].toggle();
      test++;
      startTime = millis();
    }
    else {
      blink = true;
    }
  }
  if (blink && startTime + 700 < millis()) {
    startTime = millis();
    panel.buttons[3].toggle();
  }

  // laat selectie button knipperen?
  // selectie is nieuw spel reset alles
  // gameState = 1
}

void mousePressed() {  
  for (PanelButton button : panel.buttons) {
    if (mouseX > button.xPos && mouseX < (button.xPos + button.diam)) {
      if (mouseY > button.yPos && mouseY < (button.yPos + button.diam)) {
        if (button.id == 4) {
          if (gamePause) {
            // reset everything
            field.resetField();
            panel.resetButtons();
            gameState = 0;
          }
          panel.execute(field);
          panel.resetButtons();
        }
        else if (!gamePause){
          button.toggle();
        }
      }
    }
  }
}
