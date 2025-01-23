void keyPressed() {
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'D' || key == 'd') dkey = true;
  if (key == 'S' || key == 's') skey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == 32) shoot = true;
  if (key == 'C' || key == 'c') cheatmode = !cheatmode;
  if (key == 'O' || key == 'o') check = true;
}

void keyReleased() {
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'D' || key == 'd') dkey = false;
  if (key == 'S' || key == 's') skey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == 32) shoot = false;
  if (key == 'O' || key == 'o') check = false;
}
