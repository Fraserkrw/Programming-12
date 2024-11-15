import fisica.*;
FWorld world;
FWorld world1;

//Adrian Wong
//October 29th, 2024
//1-4

color white = #FFFFFF;
color black = #000000;
color red = #FF0000;
color green = #22b14c;
color blue = #0000FF;
color brown = #9c5a3c;
color darkbrown = #2E1A01;
color orange = #ff7e00;
color maroon = #990030;
color yellow = #fff200;
color grey = #464646;

PImage[] maps;
int totalmaps;
int totalWorlds;
int currentmap = 0;
int gridSize = 32;
float zoom = 2;
boolean upkey, leftkey, rightkey, wkey, akey, dkey, skiplevel;
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
  if (currentmap == 0) {
  background(brown);
  } else if (currentmap == 1) {
  background(darkbrown);
  }
  manageMaps();
  drawWorld();
  loadPlayerMovement();
}

void drawWorld() {
  pushMatrix();
  if (player1.getX() > 183.78 && player1.getX() < 807.6) {
  translate(-player1.getX()*zoom+width/2, -player1.getY()*zoom+height/2);
  } else if (player1.getX() < 183.78) {
  translate(-183.78*zoom+width/2, -player1.getY()*zoom+height/2);
  } else if (player1.getX() > 807.6) {
  translate(-807.6*zoom+width/2, -player1.getY()*zoom+height/2);
  }
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void loadWorld(PImage img) {
  if (currentmap == 0) {
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == green || c == black) {
        terrainPixels.add(new terrainPixel(x, y, c, 0.1));
        FBox pixel = terrainPixels.get(pixelcount);
        world.add(pixel);
        pixelcount++;
      }
      if (c == maroon) {
        terrainPixels.add(new terrainPixel(x, y, "teleporterblock.png", 0, 0));
        portal = terrainPixels.get(pixelcount);
        world.add(portal);
        pixelcount++;
      }
    }
  }
 }
 
if (currentmap == 1) {
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 800);
  world.setEdges(-20, 0, 962, 992);
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == brown) {
        terrainPixels.add(new terrainPixel(x, y, "obsidianblocktexture.jpg", 0, 0));
        FBox pixel = terrainPixels.get(pixelcount);
        world.add(pixel);
        pixelcount++;
      }
      if (c == black) {
        terrainPixels.add(new terrainPixel(x, y, "stoneblocktexture.jpg", 1, 0));
        FBox pixel = terrainPixels.get(pixelcount);
        world.add(pixel);
        pixelcount++;
      }
      if (c == orange) {
        terrainPixels.add(new terrainPixel(x, y, "jumpboostarrow.png", 0, 1));
        FBox jumpboost = terrainPixels.get(pixelcount);
        world.add(jumpboost);
        pixelcount++;
      }
      if (c == yellow) {
       terrainPixels.add(new terrainPixel(x, y, "water1.png", 0, 2));
       FBox water = terrainPixels.get(pixelcount);
       world.add(water);
       pixelcount++;
      }
      if (c == grey) {
      terrainPixels.add(new terrainPixel(x, y, "iceblock.jpg", 0, 0));
      FBox ice = terrainPixels.get(pixelcount);
      world.add(ice);
      pixelcount++;
      }
      if (c == maroon) {
        terrainPixels.add(new terrainPixel(x, y, "teleporterblock.png", 0, 0));
        portal = terrainPixels.get(pixelcount);
        world.add(portal);
        pixelcount++;
      }
    }
  }
 }
}
 
 


void loadPlayer() {
  player1 = new FPlayer();
  world.add(player1);
}

void loadPlayerMovement() {
  player1.act();
}

void manageMaps() {
  if (setMap == true) {
    loadWorld(maps[currentmap]);
    loadPlayer();
    setMap = false;
  }
  if (mapchange == true) {
    pixelcount = 0;
    terrainPixels.clear();
    currentmap++;
    loadWorld(maps[currentmap]);
    world.add(player1);
    mapchange = false;
  }
}

void loadingScreen() {
   background(black);
   fill(white);
   textFont(PixelFont);
   textSize(60);
   text("Loading Next World...", width/2, height/2);
}
