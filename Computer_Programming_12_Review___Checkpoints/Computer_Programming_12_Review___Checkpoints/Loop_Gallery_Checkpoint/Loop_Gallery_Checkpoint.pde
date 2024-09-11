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
float[] pattern2r;
float[] pattern2g;
float[] pattern2b;
int[] square;
int squarenums;
int squareX, squareY;

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
  square = new int[squarenums];
  squareX = 0;
  squareY = 0;
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
  fill(134, 132, 127);
  circle (leftbuttonX, leftbuttonY, 100);
  circle (rightbuttonX, rightbuttonY, 100);
  fill(72, 71, 68);
  triangle (70, 400, 120, 375, 120, 425);
  triangle (730, 400, 680, 375, 680, 425);
}
