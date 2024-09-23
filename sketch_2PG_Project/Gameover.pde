void Gameover() {
  if (Player1Score > Player2Score) {
    background (141, 179, 211); //blue
  } else if (Player1Score < Player2Score) {
    background (237, 183, 117); //red
  } else if (Player1Score == Player2Score) {
    background (229, 97, 247); //purple
  }
}

void gameoverClicks() {
  
}
