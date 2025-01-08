class FGoomba extends FGameObject {

  int direction = L;
  int speed = 50;
  int frame = 0;
  int facing;
  float posX, posY, orgX, orgY;
  boolean checkforpos, goombadied;
  boolean settimer = false;
  int timer = 600;
  int hptimer = 300;
  PImage[] goomba;
  boolean hit = false;
  int hitnums;

  FGoomba(float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    orgX = x*gridSize;
    orgY = y*gridSize;
    setDensity(2000);
    setName("mob");
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
    hpbar();
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
        setPosition(orgX, orgY);
        setVelocity(0, 0);
        setStatic(false);
        checkforpos = true;
        settimer = false;
        goombadied = false;
        timer = 600;
      }
    }
    if (isTouching("fireball")) {
      hit = true;
      hitnums++;
      if (hitnums >= 5) {
        hitnums = 0;
        settimer = true;
        goombadied = true;
        if (checkforpos == false) {
          checkforpos = true;
          posX = getX();
          posY = getY()-25;
        }
        setPosition (1500, 1500);
        setStatic(true);
      }
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }

  void playertookgmbdmg() {
    player1.setVelocity(0, 0);
    if (direction == R) {
      player1.setPosition(player1.getX() + 20, player1.getY());
    } else if (direction == L) {
      player1.setPosition(player1.getX() - 20, player1.getY());
    }
  }

  void hpbar() {
    if (hit == true) {
      float cameraX = player1.getX();
      if (cameraX > 807.6) {
        cameraX = 807.6;
      }
      if (cameraX < 183.78) {
        cameraX = 183.78;
      }
      float cameraY = player1.getY();
      if (cameraY > 807.6) {
        cameraY = 807.6;
      }
      if (cameraY < 183.78) {
        cameraY = 183.78;
      }
      float screenX = (getX() - cameraX) * zoom + width / 2;
      float screenY = (getY() - cameraY) * zoom + height / 2 - 20;
      if (zoomout == false) {
        fill(grey);
        stroke(black);
        rect(screenX, screenY-25, 50, 10);
        fill(red);
        noStroke();
        rect(screenX, screenY-25, 50 - (hitnums * 10), 8);
      }
      if (hptimer > 0) {
        hptimer--;
      }
      if (hptimer == 0) {
        hit = false;
        hptimer = 300;
        hitnums = 0;
      }
    }
  }
}
