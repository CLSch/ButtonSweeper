/*main
minesweeper*/

BSField field;

void setup() {
  size(800,900);
  field = new BSField();
  println("start");
}

void draw() {
  background(50);
  field.drawField();
}

void mousePressed() {
  for (BSTile tile : field.tiles) {
    if (mouseX > tile.xPos && mouseX < (tile.xPos + tile.diam)) {
      if (mouseY > tile.yPos && mouseY < (tile.yPos + tile.diam)) {
        tile.isClosed = false;
        
      }
    }
  }
}
