//Adrian Wong
//January 6, 2025
//1-4

PImage diamond, grasstop, grassside, grassbottom;
float rotx, roty;

void setup() {
  size(800, 800, P3D);
  diamond = loadImage("3D Textures/Diamond.png");
  grasstop = loadImage("3D Textures/Grass_Block_Top_C.png");
  grassside = loadImage("3D Textures/Grass_Block_Side.png");
  grassbottom = loadImage("3D Textures/Grass_Block_Bottom.png");
  
  textureMode(NORMAL);
}

void draw() {
  background(0);
  diamondblock(width/4, height/4, 0, 100);
  diamondblock(width/4, height/2, 0, 100);
  diamondblock(width/4, 3*height/4, 0, 100);
  dirtblock(600, height/4, 0, 100);
  dirtblock(600, height/2, 0, 100);
  dirtblock(600, 3*height/4, 0, 100);
}

void diamondblock(float x, float y, float z, float s) {
  pushMatrix();
  translate(x, y, z);
  scale(s);
  rotateX(rotx);
  rotateY(roty);
  noStroke();
  beginShape(QUADS);
  texture(diamond);
  //top
  //     x, y, z, tx, ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  //bottom
  
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  
  endShape();
  popMatrix();
}

void dirtblock(float x, float y, float z, float s) {
  pushMatrix();
  translate(x, y, z);
  scale(s);
  rotateX(rotx);
  rotateY(roty);
  noStroke();
  beginShape(QUADS);
  //top
  //     x, y, z, tx, ty
  texture(grasstop);
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  endShape();
  //bottom
  beginShape(QUADS);
  texture(grassbottom);
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();
  //front
  beginShape(QUADS);
  texture(grassside);
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //back
  texture(grassside);
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //left
  texture(grassside);
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //right
  texture(grassside);
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  
  endShape();
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
