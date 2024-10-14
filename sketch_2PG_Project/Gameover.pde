void Gameover() {
  
  //Win Message
  if (Player1Score > Player2Score) {
    background (141, 179, 211); //blue
    fill (0);
    textSize (45);
    text("BLUE WINS!", width/2, height/4);
  } else if (Player1Score < Player2Score) {
    background (237, 183, 117); //red
    fill (0);
    textSize (45);
    text("RED WINS!", width/2, height/4);
  } else if (Player1Score == Player2Score) {
    background (229, 97, 247); //purple
    fill (0);
    textSize (45);
    text("DRAW!", width/2, height/4);
  }
  
  //Gameover Buttons
  fill(101, 101, 101);
  strokeWeight(5);
  RectTactileStroke (200, height/2, 200, 100);
  rect (200, height/2, 200, 100);
  fill (0);
  textSize(30);
  text("BACK TO MENU", width/2, (height/2)+50);
  fill(101, 101, 101);
  strokeWeight(5);
  RectTactileStroke (200, 3*height/4, 200, 100);
  rect (200, 3*height/4, 200, 100);
  fill (0);
  textSize(30);
  text("QUIT", width/2, (3*height/4)+50);
}

void gameoverClicks() {
  if (mouseX > 200 && mouseX < 400 && mouseY > height/2 && mouseY < (height/2)+100) {
    PlayerTurn = (int) random(1, 3);
    Player1Score = 0;
    Player2Score = 0;
    cardClicked = 0;
    timer = 50;
    waitingtoFlip = false;
    cardscorrect = 0;
    cardtrack = 0;
    int i = 0;
    while (i < cardnums) {
    cardcorrect[i] = false;
    clicked[i] = false;
    i++;
   }
    mode = INTRO;
  }
  if (mouseX > 200 && mouseX < 400 && mouseY > 3*height/4 && mouseY < (3*height/4)+100) {
    exit();
  }
}
