//Adrian Wong
//1-4
//September 9th, 2024

int mode;
final int Pattern1 = 0;
final int Pattern2 = 1;
final int Pattern3 = 2;

//Button
float leftbuttonX, leftbuttonY, rightbuttonX, rightbuttonY;

//Pattern1
float pattern1X, pattern1Y, pattern1D, pattern1rotate, pattern1R, pattern1G, pattern1B;

//Pattern2
int tempX, tempY;
float[] pattern2r;
float[] pattern2g;
float[] pattern2b;
int squarenums;
int[] squareX, squareY;
float brightnesschange;

//Pattern3
int numslines;
float[] lineX;
float[] lineY;
float[] pattern3r;
float[] pattern3g;
float[] pattern3b;
float ax, ay;
float yoff, yoff2, yoff3;
float counter, counter2, counter3;

void setup() {
  size (800, 800);
  mode = Pattern1;
  
  //ButtonSetup
  leftbuttonX = 100;
  leftbuttonY = 400;
  rightbuttonX = 700;
  rightbuttonY = 400;
  
  //Pattern1
  pattern1X = 400;
  pattern1Y = 400;
  pattern1D = 800;
  pattern1rotate = 0;
  pattern1R = 0;
  pattern1G = 0;
  pattern1B = 0;
  
  //Pattern2
  squarenums = 256;
  pattern2r = new float [squarenums];
  pattern2g = new float [squarenums];
  pattern2b = new float [squarenums];
  squareX = new int [squarenums];
  squareY = new int [squarenums];
  tempX = 0;
  tempY = 0;
  
  int i = 0;
  while (i < squarenums) {
   pattern2r[i] = random (0, 150);
   pattern2g[i] = random (0, 200);
   pattern2b[i] = 255;
   i++;
  }
  
  i = 0;
  while (i < squarenums) {
   squareX[i] = tempX;
   squareY[i] = tempY;
   tempX = tempX + 50;
   if (tempX == width) {
     tempX = 0;
     tempY = tempY + 50;
   }
   i++;
  }
  
  //Pattern3
  numslines = 160;
  lineX = new float [numslines];
  lineY = new float [numslines];
  pattern3r = new float [numslines];
  pattern3g = new float [numslines];
  pattern3b = new float [numslines];
  ay = 400;
  ax = 0;
  counter = 0;
  counter2 = 0;
  counter3 = 0;
  
  i = 0;
  while (i < numslines) {
   lineX[i] = ax;
   lineY[i] = ay;
   ax = ax + 5;
   i++;
  }
  
  i = 0;
  while (i < numslines) {
   pattern3r[i] = random (0, 250);
   pattern3g[i] = random (0, 250);
   pattern3b[i] = random (0, 250);
   i++;
  }
}

void draw() {
  if (mode == Pattern1) {
    pattern1();
  } else if (mode == Pattern2) {
    pattern2();
  } else if (mode == Pattern3) {
    pattern3();
  } else {
    println("Error: Mode = " + mode);
  }
}

void buttonSetup() {
  stroke(0);
  strokeWeight(3);
  fill(134, 132, 127);
  circle (leftbuttonX, leftbuttonY, 100);
  circle (rightbuttonX, rightbuttonY, 100);
  fill(72, 71, 68);
  triangle (70, 400, 120, 375, 120, 425);
  triangle (730, 400, 680, 375, 680, 425);
}
