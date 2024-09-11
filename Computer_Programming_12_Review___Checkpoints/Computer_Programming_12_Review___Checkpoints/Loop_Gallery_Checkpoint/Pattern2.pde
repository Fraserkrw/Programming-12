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
  int i = 0;
  while (i < 256) {
    colorgeneration(i);
    rect (squareX, squareY, 50, 50);
    squareX = squareY + 50;
    if (squareX == 800 & squareY < 800) {
      squareY = squareY + 50;
      squareX = 0;
   }
   i = i + 1;
  }
}

void colorgeneration(int i) {
  pattern2r[i] = random(0,255);
  pattern2g[i] = random(0,255);
  pattern2b[i] = random(0,255);
  fill (pattern2r[i], pattern2g[i], pattern2b[i]);
}


  
