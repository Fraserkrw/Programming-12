class Fireflies {

  PVector location;
  PVector dir;
  float speed;
  int x, z, fireflyX, fireflyY, fireflyZ;
  int size;
  float vx = cos(radians(random(0, 360)));
  float vy = tan(radians(random(-10, 10)));
  float vz = sin(radians(random(0, 10)));
  int randomizer;
  int blinktimer = 10;
  int blink;


  Fireflies() {
    x = int(random(0, 4000)/gridSize);
    z = int(random(0, 4000)/gridSize);
    fireflyZ = int(random(400, 750));
    size = 10;
    speed = random(1, 5);
    blink = int(random(-2, 2));
    for (int i = 0; i <= 1; i++) {
      if (map.get(x, z) == darkgrey) {
        fireflyX = (x*gridSize)-2000;
        fireflyY = (z*gridSize)-2000;
      } else if (map.get(x, z) != darkgrey) {
        x = int(random(0, 4000)/gridSize);
        z = int(random(0, 4000)/gridSize);
        i--;
      }
    }
    location = new PVector(fireflyX, fireflyZ, fireflyY);
    dir = new PVector (vx, vy, vz);
    dir.setMag(speed);
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    if (blinktimer >= 0) {
     blinktimer--; 
    }
    if (blinktimer == 0) {
      if (blink == -1) {
        fill(fireflylight);
      } else if (blink == 1) {
        fill(fireflylight1);
      }
      blinktimer = int(random(300, 600));
    }
    noStroke();
    sphere(size);
    popMatrix();
  }

  void act() {
    int hitx = int((location.x+2000)/gridSize);
    int hity = int((location.z+2000)/gridSize);
    if (map.get(hitx, hity) == darkgrey) {
      location.add(dir);
    } else {
      dir.x *= -1;
      dir.z *= -1;
      location.add(dir);
    }
    if (location.y <= 400 || location.y >= 750) {
      dir.y *= -1;
    }
  }
}
