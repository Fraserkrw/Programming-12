void Intro() {
  //Setup
  background (175, 122, 16);
  fill (255);
  textFont (PixelFont);
  textSize(80);
  text ("My Adventure", width/2, 275);
  
  //ButtonSetup
  strokeWeight (5);
  fill (101, 101, 101);
  RectTactileStroke(width/2, height/2+100, 250, 100);
  rect (width/2, height/2+100, 250, 100);
  fill (0);
  textFont (PixelFont);
  textSize(40);
  text ("START", width/2, 520);
  
  //HardcoreButton
  strokeWeight (5);
  fill (101, 101, 101);
  RectTactileStroke(width/2, height/2+250, 250, 100);
  rect (width/2, height/2+250, 250, 100);
  fill (0);
  textFont (PixelFont);
  textSize(30);
  if (hardcore == false) {
    text ("Hardcore: Off", width/2, 660);
  } else if (hardcore == true) {
    text ("Hardcore: On", width/2, 660);
  }
  
}

void introClicks() {
  //Start
  if (mouseX > 275 && mouseX < 525 && mouseY > 450 && mouseY < 550) {
    mode = GAME;
  }
  if (mouseX > 275 && mouseX < 525 && mouseY > 600 && mouseY < 700) {
    hardcore = !hardcore;
  }
}

void RectTactileStroke(int x, int y, int w, int h) {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    stroke (255, 255, 0);
  } else {
    stroke (0);
  }
}
