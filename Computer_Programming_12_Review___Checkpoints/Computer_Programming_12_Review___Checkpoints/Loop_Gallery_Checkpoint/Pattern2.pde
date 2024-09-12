void pattern2() {
  background(119, 170, 250);
  pattern2Draw();
  buttonSetup();
}

void pattern2Clicks() {
   if (dist(leftbuttonX, leftbuttonY, mouseX, mouseY) < 50) {
    mode = Pattern1;

  }
  if (dist(rightbuttonX, rightbuttonY, mouseX, mouseY) < 50) {
    mode = Pattern3;
  }
}

void pattern2Draw() {
  noStroke();
  int i = 0;
  while (i < squarenums) {
    brightnesschange = dist(mouseX, mouseY, squareX[i], squareY[i]);
    fill (pattern2r[i], pattern2g[i], pattern2b[i], brightnesschange/5);
    rect (squareX[i], squareY[i], 50, 50);
   i = i + 1;
  }
}
