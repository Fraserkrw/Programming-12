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
float cardtimer;
float[] cardX;
float[] cardY;
float[] cardD;
int cardClicked;
boolean cardanimation;
int[] cardtype;
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
  cardD = new float[cardnums];
  cardtimer = 0;
  cardchosen = new boolean[cardnums];
  cardtype = new int[cardnums];
  cards = new ArrayList();
  cardanimation = false;
  cardClicked = 0;
  timer = 50;
  xsetup = 25;
  ysetup = 125;

  int i = 0;
  while (i < cardnums) {
    cardX[i] = xsetup;
    cardY[i] = ysetup;
    cardD[i] = 40;
    cardchosen[i] = false;
    xsetup = xsetup + 100;
    if (xsetup >= 600) {
      xsetup = 25;
      ysetup = ysetup + 100;
    }
    i++;
  }

  i = 0;
  while (i < cardnums/2) {
  cards.add(i);
  cards.add(i);
  i++;
  }
  
  i = 0;
  while (i < cardnums) {
  listchoose = (int) random(0, cards.size());
  cardtype[i] = cards.get(listchoose);
  cards.remove(listchoose);
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
