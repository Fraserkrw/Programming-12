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
int cardtrackerinitial;
int cardtrackerfinal;
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
  cardnums = 42;
  cardX = new float[cardnums];
  cardY = new float[cardnums];
  cardchosen = new boolean[cardnums];
  cardtype1 = new int[cardnums/2];
  cardtype2 = new int[cardnums/2];
  cardtrackerinitial = 0;
  cardtrackerfinal = 0;
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
    cardtype1[i] = (int) random(0, cardnums/2);
    cardtrackerinitial = cardtrackerinitial + 1;
    while (cardtrackerfinal <= cardtrackerinitial) {
      if (cardtype1[i] == cardtype1[cardtrackerfinal]) {
        cardtype1[i] = (int) random(0, cardnums/2);
      }
     cardtrackerfinal = cardtrackerfinal+1;
    }
    cardtrackerfinal = 0;
    println(cardtrackerinitial);
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
