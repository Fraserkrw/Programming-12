void Gameover() {
  if (winner == RedWins) {
    background(red);
    fill(black);
    textSize(80);
    text("RED WINS", width/2, height/3);
  }
  if (winner == BlueWins) {
    background(blue);
    fill(black);
    textSize(80);
    text("BLUE WINS", width/2, height/3);
  }
  
  //Gameover Buttons
  fill(101, 101, 101);
  strokeWeight(5);
  RectTactileStroke (width/2, height/2+50, 200, 100);
  rect (width/2, height/2+50, 200, 100);
  fill (0);
  textSize(15);
  text("BACK TO MENU", width/2, (height/2)+60);
  fill(101, 101, 101);
  strokeWeight(5);
  RectTactileStroke (width/2, 3*height/4, 200, 100);
  rect (width/2, 3*height/4, 200, 100);
  fill (0);
  textSize(30);
  text("QUIT", width/2, (3*height/4)+20);
}

void gameoverClicks() {
  if (mouseX > width/2-100 && mouseX < width/2+100 && mouseY > height/2 && mouseY < height/2 + 100) {
    gameReset();
    mode = INTRO;
  }
  if (mouseX > width/2-100 && mouseX < width/2+100 && mouseY > 3*height/4-50 && mouseY < 3*height/4+50) {
    exit();
  }
}
