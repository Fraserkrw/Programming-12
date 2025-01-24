class SnowParticle {

  int x, z, snowX, snowY, snowZ;
  float speed, size;
  PVector location;
  PVector dir;

  SnowParticle() {
    x = int(random(0, 4000)/gridSize);
    z = int(random(0, 4000)/gridSize);
    snowZ = int(random(-200, 200));
    size = random(10, 60);
    speed = random(10, 50);
    for (int i = 0; i <= 1; i++) {
      if (map.get(x, z) == purple) {
        snowX = (x*gridSize)-2000;
        snowY = (z*gridSize)-2000;
      } else if (map.get(x, z) != purple) {
        x = int(random(0, 4000)/gridSize);
        z = int(random(0, 4000)/gridSize);
        i--;
      }
    }
    location = new PVector(snowX, snowZ, snowY);
    dir = new PVector (0, 0, 100);
    dir.setMag(speed);
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(white);
    noStroke();
    box(size);
    popMatrix();
  }

  void act() {
    location.add(dir);
    if (dir.y > 800) {
      dir.y = int(random(-200, 200));
    }
  }
}
