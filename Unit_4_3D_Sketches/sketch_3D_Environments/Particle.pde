class Particle extends GameObject {
  
  PVector dir;
  float speed;
  int timer = 300;
  
  Particle(PVector location) {
    super(location.x, location.y, location.z, 5);
    speed = 50;
    float vx = random(0, 50);
    float vy = random(0, 50);
    float vz = random(0, 50);
    dir = new PVector (vx, vy, vz);
    dir.setMag(speed);
  }
  
  void show() {
    
  }
  
  void act() {
    location.add(dir);
    if (timer >= 0) {
    timer--;
    }
    if (timer == 0) {
    lives = 0;
    }
  }
}
