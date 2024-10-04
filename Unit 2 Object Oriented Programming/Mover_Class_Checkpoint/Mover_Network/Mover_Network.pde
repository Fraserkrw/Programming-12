//Adrian Wong
//October 4th, 2024
//1-4

Mover[] myMovers;
int numsMovers = 50;

void setup() {
  size (800, 800);
  myMovers = new Mover[numsMovers];
  
  for(int i = 0; i < numsMovers; i++) {
    myMovers[i] = new Mover();
  }
}

void draw() {
  background (#067EC6);
  for (int i = 0; i < numsMovers; i++) {
    myMovers[i].showBody();
    myMovers[i].act();
    myMovers[i].showConnections();
  }
}
