class FGoomba extends FGameObject {

  int direction = L;
  int speed = 50;
  int frame = 0;
  int facing;
  float posX, posY;
  boolean checkforpos, goombadied;
  boolean settimer = false;
  int timer = 600;
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
        settimer = true;
        goombadied = true;
        if (checkforpos == false) {
          checkforpos = true;
          posX = getX();
          posY = getY()-50;
        }
        setPosition (1500, 1500);
        setStatic(true);
        player1.setVelocity(player1.getVelocityX(), -150);
      } else if (player1.getY() >= getY()) {
        if (cheatmode == false) {
          if (hardcore == true) {
            player1.setPosition(spawnX, spawnY);
            playerdied = true;
          } else if (hardcore == false) {
            playertookgmbdmg();
            hp = hp - 50;
          }
        }
      }
    }
    if (goombadied == true) {
      if (playerdied == true) {
        setPosition(posX, posY);
        setStatic(false);
        checkforpos = true;
        goombadied = false;
      }
    }
    if (settimer == true) {
      if (timer > 0) {
        timer--;
      }
      if (timer == 0) {
        setPosition(posX, posY);
        setStatic(false);
        checkforpos = true;
        settimer = false;
        goombadied = false;
        timer = 600;
      }
    }
    if (isTouching("fireball")) {
      settimer = true;
      goombadied = true;
      if (checkforpos == false) {
        checkforpos = true;
        posX = getX();
        posY = getY()-50;
      }
      setPosition (1500, 1500);
      setStatic(true);
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }

  void playertookgmbdmg() {
    player1.setVelocity(0, 0);
    if (direction == R) {
      player1.setPosition(player1.getX() + 50, player1.getY());
    } else if (direction == L) {
      player1.setPosition(player1.getX() - 50, player1.getY());
    }
  }
}
