import fisica.*;
FWorld world;
FWorld world1;

//Adrian Wong
//October 29th, 2024
//1-4

//Mode Framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 4;

color white = #FFFFFF;
color black = #000000;
color red = #ed1c24;
color green = #22b14c;
color lightgreen = #a8e61d;
color brown = #9c5a3c;
color orange = #ff7e00;
color maroon = #990030;
color yellow = #fff200;
color grey = #464646;
color lightgrey = #b4b4b4;
color pink = #ffa3b1;
color blue = #4d6df3;
color skyblue = #87CEEB;
color darkpurple = #6f3198;
color darkblue = #2f3699;
color lightpurple = #b5a5d5;

PImage[] maps;
boolean showmap = false;
int levelsunlocked = 0;
int totalmaps;
int currentmap = 0;
int gridSize = 32;
int spawnX, spawnY;
float zoom = 2;
boolean upkey, leftkey, rightkey, wkey, akey, dkey, skey, skiplevel, zoomout, shoot;
boolean cheatmode = false;
boolean jumped = false;
FPlayer player1;
FBox portal;
ArrayList<FBox> terrainPixels;
int pixelcount = 0;
boolean setMap = true;
boolean mapchange = false;
boolean playerdied = false;
boolean hardcore = false;
int playerfacing;
float playersafespawnX, playersafespawnY;
int hp = 100;
ArrayList<FGameObject> fancyterrain;
ArrayList<FGameObject> enemies;
ArrayList<FGameObject1> enemyvariations;

//Images
PImage Bridgeblock;
PImage cavebackground;
PImage mapicon;
PImage lockicon;
PImage skybackground;

//Fonts
PFont PixelFont;

void setup() {
  size (800, 800);
  textAlign(CENTER);
  rectMode(CENTER);
  mode = INTRO;
  
  //Initialize Fonts
  PixelFont = createFont("PixelFont.ttf", 100);
  
  //Load Images
  Bridgeblock = loadImage("bridge_center.png");
  cavebackground = loadImage("cavebackground.jpg");
  mapicon = loadImage("mapimage.png");
  lockicon = loadImage("lockimage.png");
  skybackground = loadImage("skybackground.png");
  
  
  totalmaps = 4;
  Fisica.init(this);
  maps = new PImage[totalmaps];
  maps[0] = loadImage("platformermap1.png");
  maps[1] = loadImage("platformermap2.png");
  maps[2] = loadImage("platformermap3.png");
  maps[3] = loadImage("platformermap4.png");
  terrainPixels = new ArrayList<FBox>();
  fancyterrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  enemyvariations = new ArrayList<FGameObject1>();
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
