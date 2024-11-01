import fisica.*;
FWorld world;

//Adrian Wong
//October 29th, 2024
//1-4

color white = #FFFFFF;
color black = #000000;
color red = #FF0000;
color green = #22b14c;
color blue = #0000FF;
color brown = #9c5a3c;

PImage map;
int gridSize = 32;
float zoom = 1.5;
boolean upkey, leftkey, rightkey, wkey, akey, dkey;
boolean jumped = false;
FPlayer player1;
ArrayList<FBox> terrainPixels;
int pixelcount = 0;

void setup() {
  size (800, 800);
  Fisica.init(this);
  map = loadImage("platformermap.png");
  terrainPixels = new ArrayList<FBox>();
  loadWorld(map);
  loadPlayer();
}

void draw() {
  background(brown);
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
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == green || c == black) {
        terrainPixels.add(new terrainPixel(x, y, c));
        FBox pixel = terrainPixels.get(pixelcount);
        world.add(pixel);
        pixelcount++;
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
