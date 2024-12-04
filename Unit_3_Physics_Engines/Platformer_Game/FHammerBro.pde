class FHammerBro extends FGameObject {
  
  int frame = 0;
  int timer = 100;
  int direction = L;
  boolean hammermade = false;
  boolean checkforpos = false;
  int speed = 50;
  PImage hammer = loadImage("mariosprites/hammer.png");
  PImage[] hammerbro;
  FBox hammerobject;

  FHammerBro(float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    setDensity(2000);
    setName("hammerbro");
    setRotatable(false);
    hammerbro = new PImage[2];
    hammerbro[0] = loadImage("mariosprites/hammerbro0.png");
    hammerbro[0].resize(gridSize, gridSize);
    hammerbro[1] = loadImage("mariosprites/hammerbro1.png");
    hammerbro[1].resize(gridSize, gridSize);
  }
  
  void act() {
    animate();
    collide();
    move();
  }
  
  void animate() {
    if (frame >= hammerbro.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(hammerbro[frame]);
      if (direction == L) attachImage(reverseImage(hammerbro[frame]));
      frame++;
    }
  }
  
  void collide() {
    if (isTouching("wall")) {
      direction *= -1;
      setPosition(getX()+direction*2, getY());
    }
    if (hammermade == false) {
    if (timer > 0) {
      timer--;
    }
    if (timer == 0) {
      hammermade = true;
      checkforpos = true;
      hammerobject = new FBox(20, 20);
      hammerobject.setPosition(getX(), getY());
      hammerobject.attachImage(hammer);
      hammerobject.setSensor(true);
      hammerobject.setAngularVelocity(30);
      setName("hammer");
      float x = random(-200, 200);
      hammerobject.setVelocity (x, -300);
      world.add(hammerobject);
    }
   }
   if (checkforpos == true) {
   if (hammerTouching()) {
     if (cheatmode == false) {
      player1.setPosition(spawnX, spawnY);
     }
      }
      if (hammerobject.getY() > 1000) {
      timer = 100;
      hammermade = false;
      checkforpos = false;
      world.remove(hammerobject);
      }
   }
  }
  
  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
  
  boolean hammerTouching() {
    ArrayList<FBox> hammercontactList = hammerobject.getTouching();
    for (int i = 0; i < hammercontactList.size(); i++) {
    FBox boxincontact = hammercontactList.get(i);
    if (boxincontact.getName() == "player") {
      return true;
    }
   }
   return false;
  }
}
