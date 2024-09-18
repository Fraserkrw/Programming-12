//Adrian Wong
//1-4
//September 13, 2024

int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//Game
int PlayerTurn;
int Player1Score;
int Player2Score;
float timer;
float[] cardX;
float[] cardY;
int[] cardtype1;
int[] cardtype2;
ArrayList<Integer> cards;
int listchoose;
boolean[] cardchosen;
int cardnums;
int xsetup;
int ysetup;

//Fonts
PFont KidsMagazine;


void setup() {
  size(600, 800);
  textAlign(CENTER);
  mode = INTRO;

  //Initialize Fonts
  KidsMagazine = createFont("Kids Magazine.ttf", 100);

  //Player
  PlayerTurn = (int) random(1, 3);
  Player1Score = 0;
  Player2Score = 0;

  //Game
  cardnums = 36;
  cardX = new float[cardnums];
  cardY = new float[cardnums];
  cardchosen = new boolean[cardnums];
  cardtype1 = new int[cardnums/2];
  cardtype2 = new int[cardnums/2];
  cards = new ArrayList();
  timer = 50;
  xsetup = 25;
  ysetup = 125;

  int i = 0;
  while (i < cardnums) {
    cardX[i] = xsetup;
    cardY[i] = ysetup;
    cardchosen[i] = false;
    xsetup = xsetup + 100;
    if (xsetup > 700) {
      xsetup = 25;
      ysetup = ysetup + 100;
    }
    i++;
  }

  i = 0;
  while (i < cardnums/2) {
  cards.add(i);
  i++;
  }
  
  i = 0;
  while (i < cardnums/2) {
  listchoose = (int) random(0, cards.size());
  cardtype1[i] = cards.get(listchoose);
  cards.remove(listchoose);
  println(cardtype1[i]);
  i++;
  }
  
  cards.clear();
  
  i = 0;
  while (i < cardnums/2) {
  cards.add(i);
  i++;
  }
  
  i = 0;
  while (i < cardnums/2) {
  listchoose = (int) random(0, cards.size());
  cardtype2[i] = cards.get(listchoose);
  cards.remove(listchoose);
  println(cardtype2[i]);
  i++;
  }
}

  void draw() {
    if (mode == INTRO) {
      Intro();
    } else if (mode == GAME) {
      Game();
    } else if (mode == PAUSE) {
      Pause();
    } else if (mode == GAMEOVER) {
      Gameover();
    } else {
      println("Mode Error: " + mode);
    }
  }
