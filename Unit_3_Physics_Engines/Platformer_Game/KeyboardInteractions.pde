void keyPressed() {
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'D' || key == 'd') dkey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (key == 'p' || key == 'P') skiplevel = true;
}

void keyReleased() {
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'D' || key == 'd') dkey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == LEFT) leftkey = false;
}
