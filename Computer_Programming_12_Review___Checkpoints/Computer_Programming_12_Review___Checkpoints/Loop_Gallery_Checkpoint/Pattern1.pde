void pattern1() {
  background(129, 119, 250);
  buttonSetup();
  pattern1Draw();
}

void pattern1Clicks() {
  if (dist(leftbuttonX, leftbuttonY, mouseX, mouseY) < 50) {
    mode = Pattern3;
  }
  if (dist(rightbuttonX, rightbuttonY, mouseX, mouseY) < 50) {
    mode = Pattern2;
  }
}

void pattern1Draw() {
  noStroke();
  pattern1D = 800;
  pattern1R = 0;
  pattern1G = 0;
  pattern1B = 0;
  while (pattern1D >= 0) {
    fill (13+pattern1R, 7+pattern1G, 111+pattern1B);
    ellipse (pattern1X, pattern1Y, pattern1D/2, pattern1D);
    pattern1D = pattern1D - 50;
    pattern1rotate = pattern1rotate + 10;
    pattern1R = pattern1R + 10;
    pattern1G = pattern1G + 10;
    pattern1B = pattern1B + 10;
  }
}
