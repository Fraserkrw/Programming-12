class Mover {
  
  //Instance Variables
  PVector location;
  PVector velocity;
  float size;
  float transparency;
  
  
  Mover() {
    location = new PVector (random(0,width), random(0,height));
    size = 100;
    velocity = new PVector (1, 0);
    velocity.setMag(random(1, 3));
    velocity.rotate(radians(random(0, 360)));
    transparency = 80;
  }
  
  Mover (int x, int y) {
   location = new PVector (x, y);
   size = 100;
   velocity = new PVector (1, 0);
   velocity.setMag(random(1, 3));
   velocity.rotate(radians(random(0, 360)));
   transparency = 80;
  }
  
  void showBody() {
    fill (#AEDDFA, transparency);
    noStroke();
    circle (location.x, location.y, size); 
  }
  
  void showConnections() {
    for (int i = 0; i < myMovers.size(); i++) {
      Mover other = myMovers.get(i);
      float dist = dist(location.x, location.y, other.location.x, other.location.y);
      if (dist <= 200) {
        float a = map (dist, 0, 200, 255, 0);
        stroke (255-a, a);
        strokeWeight (2+(a/100));
        line (location.x, location.y, other.location.x, other.location.y);
      }
    }
  }
  
  void act() {
    move();
    boundaries();
  }
  
  void move() {
    location.add(velocity);
  }
  
  void boundaries() {
     if (location.x >= width | location.x <= 0) {
      velocity.x = -velocity.x;
    }
    if (location.y >= height | location.y <= 0) {
      velocity.y = -velocity.y;
    }
  }
}
