//Adrian Wong
//September 5th, 2024
//1-4

boolean day;
float SunX, SunY;
float MoonX, MoonY;


void setup() {
  size(800, 800);
  day = true;
  SunX = -100;
  SunY = 600;
  MoonX = -100;
  MoonY = 600;
}

void draw() {
  //Sky
  if (day == true) {
  background(10, 161, 240);
  } else {
  background(15, 11, 155);
  }
  
  //Loop
  if (day == true) {
  Sun();
  } else {
  Moon();
  }
  
  //Ground
  noStroke();
  fill (26, 131, 5);
  rect (0, 600, width, height);
  
  //House
  House (width/2, height/2);
  
  //Tree
  Tree(150, 350);
}

void House (int x, int y) {
  stroke(0);
  
  //Main Walls
  fill(245, 100, 42);
  rect (x, y, 400, 300);
  
  //Door
  fill(134, 81, 1);
  rect (x+150, y+100, 100, 200);
  
  //Windows
  fill(149, 255, 254);
  ellipse (x+75, y+100, 75, 75);
  triangle (x+300, y+137.5, x+337.5, y+62.5, x+375, y+137.5);
  
  //Roof
  fill (118, 25, 11);
  triangle (x-20, y, x+420, y, x+200, y-200);
}

void Tree (int x, int y) {
  //Trunk
  fill(103, 63, 3);
  stroke(0);
  rect(x, y, 100, 350);
  
  //Leaves
  fill (4, 88, 15);
  noStroke();
  rect (100, 230, 145, 140); 
  ellipse (x-25, y, 75, 75);
  ellipse (x-60, y-50, 80, 80);
  ellipse (x-65, y-90, 90, 90);
  ellipse (x-50, y-120, 70, 70);
  ellipse (x-30, y-140, 80, 80);
  ellipse (x-15, y-150, 85, 85);
  ellipse (x+20, y-135, 100, 100);
  ellipse (x+60, y-140, 90, 90);
  ellipse (x+80, y-135, 70, 70);
  ellipse (x+100, y-120, 90, 90);
  ellipse (x+120, y-80, 90, 90);
  ellipse (x+135, y-30, 90, 90);
  ellipse (x+100, y, 40, 40);
  ellipse (x+40, y+15, 70, 70);
  ellipse (x+90, y+10, 70, 70);
}

void Sun() {
  fill (255, 235, 8);
  ellipse (SunX, SunY, 100, 100);
  
  if (day == true) {
  SunX = SunX + 1;
  if (SunX < 400) {
   SunY = SunY - 2;
  } else if (SunX > 400) {
   SunY = SunY + 2;
  }
  }
  if (SunX - 50 > 800) {
    day = false;
    SunX = -100;
    SunY = 600;
  }
}

void Moon() {
  fill (152, 152, 147);
  ellipse (MoonX, MoonY, 100, 100);
  fill (15, 11, 155);
  ellipse (MoonX+50, MoonY, 100, 100);
  
  if (day == false) {
  MoonX = MoonX + 1;
  if (MoonX < 400) {
   MoonY = MoonY - 2;
  } else if (MoonX > 400) {
   MoonY = MoonY + 2;
  }
  }
  if (MoonX - 50 > 800) {
    day = true;
    MoonX = -100;
    MoonY = 600;
  }
}
