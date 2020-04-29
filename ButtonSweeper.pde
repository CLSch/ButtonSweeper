/*main
minesweeper*/

BSField field;
PImage mineImg;
int gameState;

void setup() {
  
  size(800,900);
  field = new BSField();
  gameState = 0;
  mineImg = loadImage("bomb.png");
  println("start");
}

void draw() {
  background(50);
  if (gameState == 0) {
    //drawHelp();
    field.drawField();
    fill(150);
    rect(160, 600, 480, 250);
    
    // white square help
    fill(255);
    rect(180, 620, 50, 50);
    
    // black square select
    fill(30);
    rect(570, 780, 50, 50);
    
    // red square 
    fill(255, 0, 0);
    rect(180, 700, 50, 50);
    
    // yellow square
    fill(255, 255, 0);
    rect(260, 700, 50, 50);
    
    // blue square
    fill(0, 0, 255);
    rect(340, 700, 50, 50);
    
    // answer
    fill(150);
    rect(180, 780, 50, 50);
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
}
