class FGoomba extends FGameObject {
  
  int direction = L;
  int speed = 50;
  int frame = 0;
  float posX, posY;
  PImage[] goomba;
  
  FGoomba(float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    setDensity(2000);
    setName("goomba");
    setRotatable(false);
    goomba = new PImage[2];
    goomba[0] = loadImage("mariosprites/goomba0.png");
    goomba[0].resize(gridSize, gridSize);
    goomba[1] = loadImage("mariosprites/goomba1.png");
    goomba[1].resize(gridSize, gridSize);
  }
  
  void act() {
    animate();
    collide();
    move();
  }
  
  void animate() {
    if (frame >= goomba.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(goomba[frame]);
      if (direction == L) attachImage(reverseImage(goomba[frame]));
      frame++;
    }
  }
  
  void collide() {
    if (isTouching("wall")) {
      direction *= -1;
      setPosition(getX()+direction*2, getY());
    }
    if (isTouching("player")) {
      if (player1.getY() <= getY()-gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        player1.setVelocity(player1.getVelocityX(), -150);
      } else if (player1.getY() >= getY()) {
        if (cheatmode == false) {
        player1.setPosition(spawnX, spawnY);
        }
      }
    }
  }
  
  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
