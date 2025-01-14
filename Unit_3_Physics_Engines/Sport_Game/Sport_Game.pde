import fisica.*;

//Adrian Wong
//October 15th, 2024
//1-4

int mode;
final int INTRO = 1;
final int GAME = 2;
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
int winner;
final int BlueWins = 1;
final int RedWins = 2;

//Boundary
FPoly boundary;

//Key Variables
boolean rightkey, leftkey, upkey, downkey, spacekey;

//Ball Variables
FCircle ball;
float chargeX;
float velocityX, velocityY;
boolean moving;
float prevX, prevY;
float ballD;

//Goal
FCircle goal;
boolean hit;

//Arrow Varialbes
float arrowX1, arrowY1, arrowX2, arrowY2, arrowX3, arrowY3, arrowX4, arrowY4, arrowX5, arrowY5, angle;
boolean arrowActive;

//Levels
int level;
int totalLevels;
boolean levelchange;
int turnsCompleted;
boolean[] deleteFromWorld;
boolean levelskip;

//Obstacles
FBox obstacle1;
FBox obstacle2;
FBox obstacle3;
FBox obstacle4;
FBox obstacle5;
FCircle obstacle6;
FPoly obstacle7;
float obstaclerotation;
FPoly obstacle8;
FPoly obstacle9;
FPoly obstacle10;
FPoly obstacle11;
FPoly obstacle12;
FPoly obstacle13;
FBox obstacle14;

void setup() {
  size (800, 800);
  textAlign(CENTER);
  rectMode(CENTER);
  mode = INTRO;
  level = 0;
  
  //Initialize world
  makeWorld();
  
  //Instantiate boolean
  totalLevels = 7;
  deleteFromWorld = new boolean[totalLevels];
  
  for (int i = 0; i < totalLevels; i++) {
    deleteFromWorld[i] = false;
  }
  
  //Key Variables
  rightkey = false;
  leftkey = false;
  upkey = false;
  downkey = false;
  spacekey = false;
  arrowActive = true;
  levelskip = false;
  
  //Player
  PlayerTurn = (int) random(1, 3);
  Player1Score = 0;
  Player2Score = 0;
  winner = 0;
  
  //Angle Variables
  angle = -PI/2; //Arrow
  obstaclerotation = 5;
  
  //Game Variables
  chargeX = 0;
  moving = false;
  hit = false;
  levelchange = false;
  ballD = 40;
  
  //Initialize Fonts
  KidsMagazine = createFont("Kids Magazine.ttf", 100);
  
  //Add Boundaries
  BoxBoundarySetup();
  addBall();
  addGoal();
}

void draw() {
   world.step();
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
  world.setGravity(0, 0);
}
