void pattern1() {
  background(129, 119, 250);
  pattern1Draw();
  buttonSetup();
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
  int i = 0;
  pattern1D = 1200;
  pattern1R = 0;
  pattern1G = 0;
  pattern1B = 0;
  while (i < 120) {
     fill (13+pattern1R, 7+pattern1G, 111+pattern1B);
     ellipse (pattern1X, pattern1Y, pattern1D, pattern1D);
     pattern1D = pattern1D - 10;
     pattern1R = pattern1R + 1;
     pattern1G = pattern1G + 1;
     pattern1B = pattern1B + 1;
    i++;
  }
}
