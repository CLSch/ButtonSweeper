/*main
minesweeper*/

void setup() {
  size(800,900);
  BSField field = new BSField();
}

void draw() {
  background(50);
  // test
  drawField();
}

void drawField() {
  //fill(153);
  //noStroke();
  stroke(153);
  // 70 + 80*6 + 1 = 551
  for(float y = 70; y < 551 ; y+= 80) {
    for(float x = 160; x < 641; x+= 80) {
      line(160, y, 640, y);
      line(x, 70, x, 550);
    }
  }
}
