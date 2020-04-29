/*main
minesweeper*/

BSField field;

void setup() {
  size(800,900);
  field = new BSField();
}

void draw() {
  background(50);
  // test
  drawField();
}

void drawField() {
  //noStroke();
  stroke(10);
  // 70 + 80*6 + 1 = 551
  int tileNum = 0;
  for(float y = 70; y < 550 ; y+= 80) {
    for(float x = 160; x < 640; x+= 80) {
      fill(200);
      if (field.tiles[tileNum].isClosed) {
        fill(150);
      }
      
      rect(x, y, 80, 80);
      fill(255);
      textSize(50);
      // why this x and y???
      text(str(field.tiles[tileNum].value), x+25, y+60);
      tileNum++;
    }
  }
}
