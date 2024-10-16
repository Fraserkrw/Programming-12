void Intro() {
  //Setup
  background (175, 122, 16);
  fill (255);
  textFont (KidsMagazine);
  textSize(80);
  text ("MINI GOLF", width/2, 275);
  
  //ButtonSetup
  strokeWeight (5);
  fill (101, 101, 101);
  RectTactileStroke(width/2, height/2+100, 250, 100);
  rect (width/2, height/2+100, 250, 100);
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
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    stroke (255, 255, 0);
  } else {
    stroke (0);
  }
}
