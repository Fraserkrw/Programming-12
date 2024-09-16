void Intro() {
  //Setup
  background (175, 122, 16);
  fill (255);
  textFont (KidsMagazine);
  textSize(80);
  text ("MEMORY", width/2, 275);
  
  //ButtonSetup
  strokeWeight (5);
  fill (101, 101, 101);
  RectTactileStroke(175, 450, 250, 100);
  rect (175, 450, 250, 100);
  fill (0);
  textFont (KidsMagazine);
  textSize(40);
  text ("START", width/2, 520);
}

void introClicks() {
  //Start
  if (mouseX > 275 && mouseX < 525 && mouseY > 450 && mouseY < 550) {
    mode = GAME;
  }
}

void RectTactileStroke(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke (255, 255, 0);
  } else {
    stroke (0);
  }
}
