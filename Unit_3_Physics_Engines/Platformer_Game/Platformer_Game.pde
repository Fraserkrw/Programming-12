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
boolean upkey, leftkey, rightkey, wkey, akey, dkey;
FPlayer player1;

void setup() {
  size (800, 800);
  Fisica.init(this);
  map = loadImage("platformermap.png");
  loadWorld(map);
  loadPlayer();
}

void draw() {
  background(brown);
  world.step();
  world.draw();
  loadPlayerMovement();
}

void loadWorld(PImage img) {
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == green || c == black) {
        FBox terrainpixel = new FBox(gridSize, gridSize);
        terrainpixel.setPosition(x*gridSize, y*gridSize);
        terrainpixel.setStatic(true);
        terrainpixel.setGrabbable(false);
        terrainpixel.setFill(c);
        world.add(terrainpixel);
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
