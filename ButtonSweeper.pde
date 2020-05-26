/*main



minesweeper*/

BSField field;
SwitchPanel panel;
PImage mineImg;
PImage flagImg;
int gameState;
int startTime;
boolean gamePause, blink, firstTime, help;
int curBut = 0;

void setup() {
  // size of screen
  size(800,900);
  
  // initialisation
  field = new BSField();
  panel = new SwitchPanel();
  gameState = 0;
  mineImg = loadImage("bomb.png");
  flagImg = loadImage("flag.png");
  startTime = millis();
  blink = false;
  firstTime = true;
  curBut = 0;
  help = false;
}

/* draw screen features based on screen state */
void draw() {
  background(50);
  if (gameState == 0)
    drawHelp();
  else if (gameState == 1)
    drawGame();
  else if (gameState == 2)
    drawLose();
  else if (gameState == 3)
    drawWin();
}

/* draw the help menu */
void drawHelp() {
  help = true;
  fill(80);
  rect(160, 70, 480, 480);
  
  textSize(20);
  fill(0, 255, 0);
  text("Help menu", 190, 100);
  textSize(15);
  text("Options:", 190, 125);
  
  menuHelper(255, 0, 0, 190, 150);
  menuHelper(0, 255, 0, 190, 195);
  menuHelper(0, 0, 255, 190, 240);
  menuHelper(255, 255, 0, 190, 285);
  menuHelper(255, 0, 255, 190, 330);
  menuHelper(0, 255, 255, 190, 375);
  menuHelper(255, 255, 255, 190, 420);
  
  fill(70);
  noStroke();
  rect(190, 465, 20, 20);
  rect(190+30, 465, 20, 20);
  rect(190+60, 465, 20, 20);
  fill(255, 0, 0);
  stroke(0);
  rect(190+90, 465, 20, 20);
  
  fill(0, 255, 0);
  text("flag tile", 350, 165);
  text("open tile", 350, 210);
  text("go one tile up", 350, 255);
  text("go one tile down", 350, 300);
  text("go one tile to the right", 350, 345);
  text("go one tile to the left", 350, 390);
  text("help menu", 350, 435);
  text("execute command", 350, 475);
  text("(click this button to continue)", 350, 495);
  
  panel.drawPanel();
  
  if (startTime + 700 < millis()) {
    startTime = millis();
    panel.buttons[3].toggle();
  }
}

/* helper for drawing the examples of buttons */
void menuHelper(int col1, int col2, int col3, float x, float y) {
  stroke(0);
  fill(col1, 0, 0);
  rect(x, y, 20, 20);
  fill(col2, 0, 0);
  rect(x+30, y, 20, 20);
  fill(col3, 0, 0);
  rect(x+60, y, 20, 20);
  noStroke();
  fill(70);
  rect(x+90, y, 20, 20);  
}

/* draw the field */
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
    panel.buttons[curBut].toggle();
    firstTime = false;
  }
  if (!blink && startTime + 100 < millis()) {   
    if (curBut < 11) {
      panel.buttons[curBut%4].toggle();
      panel.buttons[(curBut+1)%4].toggle();
      curBut++;
      startTime = millis();
    }
    else {
      blink = true;
      //reset
      curBut = 0;
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

/* if a button is clicked, turn it on/off and/or execute the 'code' */
void mousePressed() {  
  for (PanelButton button : panel.buttons) {
    if (mouseX > button.xPos && mouseX < (button.xPos + button.diam)) {
      if (mouseY > button.yPos && mouseY < (button.yPos + button.diam)) {
        if (button.id == 4) {
          if (gamePause) {
            // reset everything
            field.resetField();
            panel.resetButtons();
            blink = false;
            firstTime = true;
            gameState = 1;
          }
          else if (help) {
            help = false;
            panel.resetButtons();
            gameState = 1;
          }
          else {
            panel.execute(field);
            panel.resetButtons();
          }
        }
        else if (!gamePause && !help){
          button.toggle();
        }
      }
    }
  }
}
