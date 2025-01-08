void Gameover() {
  background(#3588FA);
  fill(black);
  textSize(80);
  text("WELL DONE!", width/2, height/3);

  fill(101, 101, 101);
  strokeWeight(5);
  RectTactileStroke (width/2, height/2+50, 200, 100);
  rect (width/2, height/2+50, 200, 100);
  fill (0);
  textSize(20);
  text("BACK TO MENU", width/2, (height/2)+60);
  fill(101, 101, 101);
  strokeWeight(5);
  RectTactileStroke (width/2, 3*height/4, 200, 100);
  rect (width/2, 3*height/4, 200, 100);
  fill (0);
  textSize(40);
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

void gameReset() {
  player1.setVelocity(0, 0);
  pixelcount = 0;
  hp = 100;
  terrainPixels.clear();
  enemies.clear();
  fancyterrain.clear();
  world.remove(portal);
  currentmap = 0;
  levelsunlocked = 0;
  setMap = true;
  mode = INTRO;
}
