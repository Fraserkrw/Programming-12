//Adrian Wong
//September 5th, 2024
//1-4

void setup() {
  size(800, 800);
}

void draw() {
  //Sky
  background(10, 161, 240);
  
  //Ground
  noStroke();
  fill (26, 131, 5);
  rect (0, 700, width, height);
  
  //House
  House (width/2, height/2);
  
  //Tree
  Tree (150, 350);
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
  rect (x-50, y-120, 145, 140); 
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
}

void Sun() {
  
}
