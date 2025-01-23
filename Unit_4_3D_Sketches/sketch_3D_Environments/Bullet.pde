class Bullet extends GameObject {
  PVector dir;
  float speed;

  Bullet() {
    super(eyeX, eyeY, eyeZ, 10);
    speed = 50;
    float vx = cos(leftRightHeadAngle);
    float vy = tan(upDownHeadAngle);
    float vz = sin(leftRightHeadAngle);
    dir = new PVector (vx, vy, vz);
    dir.setMag(speed);
  }

  //void show() {
   
  //}

  void act() {
    int hitx = int((location.x+2000)/gridSize);
    int hity = int((location.z+2000)/gridSize);
    if (map.get(hitx, hity) == darkgrey) {
      location.add(dir);
    } else {
      lives = 0;
      for (int i = 0; i < 100; i++) {
        objects.add(new Particle(location, dir));
      }
    }
  }
}
