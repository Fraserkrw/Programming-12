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

//Map variables
int gridSize;
PImage map;
PImage stoneblock, glowstone, darkoak, glass;
PImage grasstop, grassside, grassbottom;
PImage bookshelfsides, oakplank;
int ceilingheight = 7;
int floorheight = 1;

//Game Objects
ArrayList<GameObject> objects;
ArrayList<Fireflies> fireflies;
boolean shoot;

boolean wkey, akey, skey, dkey, upkey, downkey;
boolean cheatmode = false;
boolean check = false;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  //size(displayWidth, displayHeight, P3D);
  fullScreen(P3D);
  textureMode(NORMAL);
  
  objects = new ArrayList<GameObject>();
  fireflies = new ArrayList<Fireflies>();
  wkey = akey = skey = dkey = false;
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
  grasstop = loadImage("3D Textures/Grass_Block_Top_C.png");
  grassside = loadImage("3D Textures/Grass_Block_Side.png");
  grassbottom = loadImage("3D Textures/Grass_Block_Bottom.png");
  
  //Bookshelf
  bookshelfsides = loadImage("3D Textures/bookshelf.png");
  oakplank = loadImage("3D Textures/oakplank.png");
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
  shoot();
  fireflies(1);
  //if(check == true) {
  //println(eyeY);
  //check = false;
  //}
  
  for (int i = 0; i < objects.size(); i++) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    }
  }
  
  for (int i = 0; i < fireflies.size(); i++) {
    Fireflies fly = fireflies.get(i);
    fly.act();
    fly.show();
  }
}
