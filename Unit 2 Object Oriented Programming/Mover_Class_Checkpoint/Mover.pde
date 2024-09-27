class Mover {
  
  //Instance Variables
  float x, y, r, g, b;
  float size;
  
  //Constructor
  Mover() {
    x = width/2;
    y = width/2;
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    size = random (50, 200);
  }
  
  //Behavior functions
  void show() {
    stroke(0);
    strokeWeight(5);
    if (mode == ColorSetMovers) {
    fill (r, g, b);
    circle(x, y, 100);
    } else if (mode == ColorRandomMovers) {
    fill (random(0,255), random(0,255), random(0,255));
    circle(x, y, 100);
    } else if (mode == SizeSetMovers) {
    fill (255);
    circle(x, y, size);
    }
    else if (mode == SizeRandomMovers) {
    fill (255);
    circle(x, y, random(50, 200));
    }
  }
  
  void act() {
    x = x + random (-2, 2);
    y = y + random (-2, 2);
  } 
}
