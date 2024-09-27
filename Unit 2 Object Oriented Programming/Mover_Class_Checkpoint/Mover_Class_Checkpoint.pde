//Adrian Wong
//September 26, 2024
//1-4

Mover[] myMovers;
int numsMovers = 20;

int mode;
final int ColorSetMovers = 1;
final int ColorRandomMovers = 2;
final int SizeSetMovers = 3;
final int SizeRandomMovers = 4;

void setup() {
  size (800, 800);
  mode = ColorSetMovers;
  myMovers = new Mover[numsMovers];
  
  int i = 0;
  while (i < numsMovers) {
    myMovers[i] = new Mover();
    i++;
  }
}

void draw() {
  background (0);
  
  int i = 0;
  while (i < numsMovers) {
  myMovers[i].act();
  myMovers[i].show();
  i++;
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    mode = ColorSetMovers;
  }
  if (keyCode == LEFT) {
    mode = ColorRandomMovers;
  }
  if (keyCode == UP) {
    mode = SizeSetMovers;
  }
  if (keyCode == DOWN) {
    mode = SizeRandomMovers;
  }
}
