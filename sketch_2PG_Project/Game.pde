void Game() {
  BackgroundSetup();
  PlayerScoreTracking();
  CardSetup();
  PlayerTurnNotification();
}

void gameClicks() {
  int i = 0;
  while (i < cardnums) {
    if (cardcorrect[i] == false) {
     CardClicked(i);
   }
  i++;
 }
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
      //textFont (KidsMagazine);
      textSize(40);
      text ("BLUE STARTS", width/2, height/2);
      
      //Timer
      timer = timer - 0.5;
    }
  } if (mode == GAME & PlayerTurn == 2) {
    if (timer >= 0) {
      fill (95, 95, 95);
      rect (90, 330, 420, 100);
      fill (237, 183, 117);
      //textFont (KidsMagazine);
      textSize(40);
      text ("RED STARTS", width/2, height/2);
      
      //Timer
      timer = timer - 0.5;
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
  //textFont (KidsMagazine);
  textSize (20);
  text (Player1Score, 270, 35);

  //Player2 Score
  fill (237, 183, 117);
  //textFont (KidsMagazine);
  textSize (20);
  text (Player1Score, 330, 35);
}

void CardSetup() {
  int i = 0;
  while (i < cardnums) {
    if (cardcorrect[i] == false) {
      manageCards(i);
    }
   i++;
  }
}

void manageCards(int i) {
  stroke(255);
  
  //Color Distribution
  if (cardY[i] == 125) {
    if (clicked[i] == true) {
    fill (255);
    } else {
    fill (250, 129, 129);
    }
  } else if (cardY[i] == 225) {
    if (clicked[i] == true) {
    fill (255);
    } else {
    fill (140, 129, 250);
    }
  } else if (cardY[i] == 325) {
    if (clicked[i] == true) {
    fill (255);
    } else {
    fill (243, 129, 250);
    }
  } else if (cardY[i] == 425) {
    if (clicked[i] == true) {
    fill (255);
    } else {
    fill (154, 250, 129);
    }
  } else if (cardY[i] == 525) {
    if (clicked[i] == true) {
    fill (255);
    } else {
    fill (250, 208, 129);
    }
  } else if (cardY[i] == 625) {
    if (clicked[i] == true) {
    fill (255);
    } else {
    fill (250, 135, 129);
    }
  }
  
  //Cards
  rect(cardX[i], cardY[i], cardD[i], 50);
  
  ////Card Animation
  if (cardD[cardClicked] > -40 && cardanimation == true) {
    cardD[cardClicked] = cardD[cardClicked] - animationSpeed;
    cardX[cardClicked] = cardX[cardClicked] + animationSpeed/2;
  if (cardD[cardClicked] <= -40) {
   cardanimation = false;
   }
  }
  if (clicked[i] == true && cardanimation == false) {
   fill (0);
   textSize(20);
   text(cardtype[i], cardX[i]-20, cardY[i]+25);
   }
   if (cardtrack == 2) {
     if (card1chosen == card2chosen) {
      cardcorrect[card1number] = true;
      cardcorrect[card2number] = true;
    } else {
      cardtrack = 0;
      cardD[card1number] = 40;
      cardD[card2number] = 40;
     }
   }
 }

void CardClicked(int i) {
  if (mouseX > cardX[i] & mouseX < cardX[i]+40 & mouseY > cardY[i] & mouseY < cardY[i]+50) {
      cardanimation = true;
      cardClicked = i;
      clicked[i] = true; 
      cardtrack = cardtrack + 1;
      card1chosen = cardtype[i];
      card1number = i;
      if (cardtrack == 2) {
      card2number = i;
      card2chosen = cardtype[i];
     }
    println ("card1number: " + card1number);
    println ("card2chosen: " + card1chosen);
  }
}
