class Particle extends GameObject {
  
  PVector dir;
  float speed;
  int timer = 60;
  int randomizer;
  
  Particle(PVector location, PVector snowballdir) {
    super(location.x, location.y, location.z, 8);
    randomizer = int(random(-2, 2));
    speed = 10;
    float vx = cos(radians(random(-360,360)));
    float vy = tan(radians(random(-360,360)));
    float vz = sin(radians(random(-360,360)));
    dir = new PVector (snowballdir.x+(vx*randomizer*75), snowballdir.y+(vy*randomizer*75), -snowballdir.z+(vz*randomizer*75));
    dir.setMag(speed);
  }
  
  //void show() {
    
  //}
  
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
