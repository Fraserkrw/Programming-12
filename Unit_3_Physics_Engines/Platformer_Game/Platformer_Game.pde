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
color darkbrown = #672C05;
color orange = #ff7e00;
color maroon = #990030;

PImage[] maps;
int totalmaps;
int totalWorlds;
int currentmap = 0;
int gridSize = 32;
float zoom = 1.5;
boolean upkey, leftkey, rightkey, wkey, akey, dkey;
boolean jumped = false;
FPlayer player1;
FBox portal;
ArrayList<FBox> terrainPixels;
ArrayList<FWorld> worlds;
int pixelcount = 0;
boolean setMap = true;
boolean mapchange = false;

void setup() {
  size (800, 800);
  
  totalmaps = 2;
  totalWorlds = 2;
  Fisica.init(this);
  maps = new PImage[3];
  maps[0] = loadImage("platformermap1.png");
  maps[1] = loadImage("platformermap2.png");
  terrainPixels = new ArrayList<FBox>();
  worlds = new ArrayList<FWorld>();
  
  //for (int i = 0; i < totalWorlds; i++) {
  //worlds.add(new FWorld(-2000, -2000, 2000, 2000));
  //}
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
  translate(-player1.getX()*zoom+width/2, -player1.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void loadWorld(PImage img) {
  if (currentmap == 0) {
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 800);
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == green || c == black) {
        terrainPixels.add(new terrainPixel(x, y, c));
        FBox pixel = terrainPixels.get(pixelcount);
        world.add(pixel);
        pixelcount++;
      }
      if (c == maroon) {
        terrainPixels.add(new terrainPixel(x, y, "teleporterblock.png", 0));
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
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == brown) {
        terrainPixels.add(new terrainPixel(x, y, "obsidianblocktexture.jpg", 0));
        FBox pixel = terrainPixels.get(pixelcount);
        world.add(pixel);
        pixelcount++;
      }
      if (c == black) {
        terrainPixels.add(new terrainPixel(x, y, "stoneblocktexture.jpg", 0.4));
        FBox pixel = terrainPixels.get(pixelcount);
        world.add(pixel);
        pixelcount++;
      }
      if (c == maroon) {
        terrainPixels.add(new terrainPixel(x, y, "teleporterblock.png", 0));
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

}
