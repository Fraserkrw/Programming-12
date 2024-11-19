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
color red = #FF0000;
color green = #22b14c;
color lightgreen = #a8e61d;
color blue = #0000FF;
color brown = #9c5a3c;
color darkbrown = #2E1A01;
color orange = #ff7e00;
color maroon = #990030;
color yellow = #fff200;
color grey = #464646;
color lightgrey = #b4b4b4;
color pink = #ffa3b1;

PImage[] maps;
int totalmaps;
int totalWorlds;
int currentmap = 0;
int gridSize = 32;
float zoom = 2;
boolean upkey, leftkey, rightkey, wkey, akey, dkey, skiplevel, zoomout;
boolean jumped = false;
FPlayer player1;
FBox portal;
ArrayList<FBox> terrainPixels;
ArrayList<FWorld> worlds;
int pixelcount = 0;
boolean setMap = true;
boolean mapchange = false;


//Fonts
PFont PixelFont;

void setup() {
  size (800, 800);
  textAlign(CENTER);
  rectMode(CENTER);
  mode = INTRO;
  
  //Initialize Fonts
  PixelFont = createFont("PixelFont.ttf", 100);
  
  totalmaps = 2;
  totalWorlds = 2;
  Fisica.init(this);
  maps = new PImage[3];
  maps[0] = loadImage("platformermap1.png");
  maps[1] = loadImage("platformermap2.png");
  terrainPixels = new ArrayList<FBox>();
  worlds = new ArrayList<FWorld>();
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
