//Adrian Wong
//January 8th, 2025
//1-4

import java.awt.Robot;
Robot rbt;
boolean skipFrame;

//color pallette
color black = #000000;
color white = #FFFFFF;
color brown = #9c5a3c;
color darkgrey = #464646;
color orange = #ff7e00;
color green = #22b14c;
color skyblue = #00b7ef;
color purple = #4d6df3;
color red = #ed1c24;
color fireflylight = #E5F75F;
color fireflylight1 = #FACE56;

//Map variables
int gridSize;
PImage map;
PImage stoneblock, glowstone, darkoak, glass;
PImage grasstop, grassside, grassbottom;
PImage bookshelfsides, oakplank;
PImage barreltop, barrelside;
PImage furnacefront, furnaceside, furnacetop;
int ceilingheight = 7;
int floorheight = 1;

//Game Objects
ArrayList<GameObject> objects;
ArrayList<Fireflies> fireflies;
ArrayList<SnowParticle> snow;
boolean shoot;
int snownums = 1000;

boolean wkey, akey, skey, dkey, upkey, downkey;
boolean cheatmode, check, spawnmob;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  //size(displayWidth, displayHeight, P3D);
  fullScreen(P3D);
  textureMode(NORMAL);
  
  objects = new ArrayList<GameObject>();
  fireflies = new ArrayList<Fireflies>();
  snow = new ArrayList<SnowParticle>();
  wkey = akey = skey = dkey = false;
  cheatmode = check = spawnmob = false;
  eyeX = -68;
  eyeY = height/2;
  eyeZ = 70;
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;
  leftRightHeadAngle = radians(270);
  noCursor();
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;

  //Initialize images
  map = loadImage("maps/map1.png");
  gridSize = 100;
  stoneblock = loadImage("3D Textures/Stone_Bricks.png");
  glowstone = loadImage("3D Textures/glowstone.jpeg");
  darkoak = loadImage("3D Textures/darkoak.jpeg");

  //Grassblock
  grassside = loadImage("3D Textures/Grass_Block_Side.png");
  grassbottom = loadImage("3D Textures/Grass_Block_Bottom.png");
  
  //Bookshelf
  bookshelfsides = loadImage("3D Textures/bookshelf.png");
  oakplank = loadImage("3D Textures/oakplank.png");
  
  //Barrel
  barreltop = loadImage("3D Textures/barreltop.jpeg");
  barrelside = loadImage("3D Textures/barrelside.jpeg");
  
  //Furnace
  furnacetop = loadImage("3D Textures/furnacetop.jpeg");
  furnaceside = loadImage("3D Textures/furnaceside.jpeg");
  furnacetop = loadImage("3D Textures/furnacetop.jpeg");
  
  spawnsnow(snownums);
}

void draw() {
  background(#3BAAFC);
  if (cheatmode == false) {
  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  } else if (cheatmode == true) {
  pointLight(109, 116, 109, eyeX, eyeY, eyeZ);
  }
  drawFloor(-2000, 2000, height, 100);
  //drawFloor(-4000, 4000, height-gridSize*4, 100);
  drawFocalPoint();
  controlCamera();
  drawMap();
  spawnfireflies();
  shoot();
  if(check == true) {
  println(eyeY);
  check = false;
  }
  
  for (int i = 0; i < objects.size(); i++) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    }
  }
  for (int i = 0; i < snownums; i++) {
    SnowParticle snowparticle = snow.get(i);
    snowparticle.show();
    snowparticle.act();
  }
  for (int i = 0; i < fireflies.size(); i++) {
    Fireflies fly = fireflies.get(i);
    fly.act();
    fly.show();
  }
}
