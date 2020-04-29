/*main
minesweeper*/

BSField field;
PImage mineImg;

void setup() {
  size(800,900);
  field = new BSField();
  mineImg = loadImage("bomb.png");
  println("start");
}

void draw() {
  background(50);
  field.drawField();
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
