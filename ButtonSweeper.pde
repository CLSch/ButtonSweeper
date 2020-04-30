/*main
minesweeper*/

BSField field;
SwitchPanel panel;
PImage mineImg;
int gameState;

void setup() {
  
  size(800,900);
  field = new BSField();
  panel = new SwitchPanel();
  gameState = 0;
  mineImg = loadImage("bomb.png");
  println("start");
}

void draw() {
  background(50);
  if (gameState == 0) {
    //drawHelp();
    field.drawField();
    panel.drawPanel();
  
  }
  else if (gameState == 1) {
    drawGame();
  }
  else if (gameState == 2) {
    drawLose();
  }
  else if (gameState == 3) {
    drawWin();
  }
  
  
}

void drawStart() {
}

void drawGame() {
  field.drawField();
  
  fill(150);
  rect(160, 600, 480, 250);
}

void drawLose() {
}

void drawWin() {
}

void mousePressed() {
  int tileArPos = 0;
  for (BSTile tile : field.tiles) {
    if (mouseX > tile.xPos && mouseX < (tile.xPos + tile.diam)) {
      if (mouseY > tile.yPos && mouseY < (tile.yPos + tile.diam)) {
        tile.isClosed = false;
        println(tileArPos);
        
        if (tile.value == -1)
          // this check needs to be in the drawfield func
          println("MINE!");
        else if (tile.value == 0)
          field.emptyField(tileArPos);
      }
    }
    tileArPos++;
  }
  
  for (PanelButton button : panel.buttons) {
    if (mouseX > button.xPos && mouseX < (button.xPos + button.diam)) {
      if (mouseY > button.yPos && mouseY < (button.yPos + button.diam)) {
        if (button.id == 4)
          panel.execute(field);
        else
          button.toggle();
      }
    }
  }
}
