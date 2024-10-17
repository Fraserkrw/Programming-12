import fisica.*;

//Adrian Wong
//October 15th, 2024
//1-4

int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

FWorld world;

//Fonts
PFont KidsMagazine;

//Color Variables
color blue = #8DB3D3;
color red = #EDB775;
color brown = color(166, 120, 24);
color black = color(0);
color white = color(255);

//Player Variables
int PlayerTurn;
final int Blue = 1;
final int Red = 2;
int Player1Score;
int Player2Score;

//Key Variables
boolean rightkey, leftkey;

//Arrow Varialbes
float arrowX1, arrowY1, arrowX2, arrowY2, arrowX3, arrowY3, arrowX4, arrowY4, arrowX5, arrowY5, angle;

void setup() {
  size (800, 800);
  textAlign(CENTER);
  rectMode(CENTER);
  mode = INTRO;
  
  //Initialize world
  makeWorld();
  
  //Key Variables
  rightkey = false;
  leftkey = false;
  
  //Player
  PlayerTurn = (int) random(1, 3);
  Player1Score = 0;
  Player2Score = 0;
  
  //Arrow Variables
  angle = -PI/2;
  
  //Initialize Fonts
  //KidsMagazine = createFont("Kids Magazine.ttf", 100);
  
  //Add Boundaries
  BoxBoundarySetup();
  addBall();
}

void draw() {
  if (mode == INTRO) {
      Intro();
    } else if (mode == GAME) {
      Game();
    } else if (mode == GAMEOVER) {
      Gameover();
    } else {
      println("Mode Error: " + mode);
    }
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
}
