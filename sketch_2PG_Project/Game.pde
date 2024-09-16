void Game() {
  BackgroundSetup();
  PlayerScoreTracking();
  CardSetup();
  PlayerTurnNotification();
}

void gameClicks() {
  
}

void BackgroundSetup() {
  //Background Setup
  if (PlayerTurn == 1) {
    background (141, 179, 211); //blue
  } else {
    background (237, 183, 117); //red
  }

  //Playmat
  stroke(0);
  fill (100, 97, 93);
  rect (0, 100, 600, 600);
}

void PlayerTurnNotification() {
  if (mode == GAME & PlayerTurn == 1) {
    if (timer >= 0) {
      fill (95, 95, 95);
      rect (90, 330, 420, 100);
      fill (141, 179, 211);
      textFont (KidsMagazine);
      textSize(40);
      text ("BLUE STARTS", width/2, height/2);
      println (timer);
      
      //Timer
      timer = timer - 0.5;
    }
  } if (mode == GAME & PlayerTurn == 2) {
    if (timer >= 0) {
      fill (95, 95, 95);
      rect (90, 330, 420, 100);
      fill (237, 183, 117);
      textFont (KidsMagazine);
      textSize(40);
      text ("RED STARTS", width/2, height/2);
      println (timer);
      
      //Timer
      timer = timer - 1;
    }
  }
}

void PlayerScoreTracking() {
  //Scoreboard
  stroke(0);
  fill (100, 97, 93);
  rect (250, 0, 100, 50);
  line (295, 25, 305, 25);

  //Player1 Score
  noStroke();
  fill (141, 179, 211);
  textFont (KidsMagazine);
  textSize (20);
  text (Player1Score, 270, 35);

  //Player2 Score
  fill (237, 183, 117);
  textFont (KidsMagazine);
  textSize (20);
  text (Player1Score, 330, 35);
}

void CardSetup() {
  int i = 0;
  //if (timer == 0) {
  while (i < cardnums) {
    if (cardchosen[i] == false) {
      manageCards(i);
    }
   i++;
  }
  //}
}

void manageCards(int i) {
  stroke(255);
  
  //Color Distribution
  if (cardY[i] == 125) {
    fill (250, 129, 129);
  } else if (cardY[i] == 225) {
    fill (140, 129, 250);
  } else if (cardY[i] == 325) {
    fill (243, 129, 250);
  } else if (cardY[i] == 425) {
    fill (154, 250, 129);
  } else if (cardY[i] == 525) {
    fill (250, 208, 129);
  } else if (cardY[i] == 625) {
    fill (250, 135, 129);
  }
  
  //Cards
  rect(cardX[i], cardY[i], 40, 50);
}
