class FBoo extends FGameObject {

  int direction = L;
  int speed = 50;
  boolean playerinsight = false;
  boolean readytochase = true;
  boolean settimer = false;
  boolean boodied, checkforpos, spawnmode, angry, still;
  float posX, posY, orgX, orgY;
  int timer = 600;
  PImage[] boochill;
  PImage[] boomad;
  int frame = 0;
  boolean hit = false;
  int hitnums;
  int hptimer = 300;

  FBoo (float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    orgX = x*gridSize;
    orgY = y*gridSize;
    setRotatable(false);
    setDensity(2000);
    setFill(255);
    setName("mob");
    boochill = new PImage[2];
    boochill[0] = loadImage("ghost1.png");
    boochill[0].resize(gridSize, gridSize);
    boochill[1] = loadImage("ghost2.png");
    boochill[1].resize(gridSize, gridSize);
    boomad = new PImage[2];
    boomad[0] = loadImage("ghost1mad.png");
    boomad[0].resize(gridSize, gridSize);
    boomad[1] = loadImage("ghost2mad.png");
    boomad[1].resize(gridSize, gridSize);
  }

  void act() {
    animate();
    collide();
    move();
    sense();
    hpbar();
  }

  void animate() {
    if (angry == false) {
      if (frame >= boochill.length) frame = 0;
      if (frameCount % 5 == 0) {
        if (direction == L) attachImage(boochill[frame]);
        if (direction == R) attachImage(reverseImage(boochill[frame]));
        if (still == false) {
        frame++;
        }
      }
    }
    if (angry == true) {
      if (frame >= boomad.length) frame = 0;
      if (frameCount % 5 == 0) {
        if (direction == L) attachImage(boomad[frame]);
        if (direction == R) attachImage(reverseImage(boomad[frame]));
        frame++;
      }
    }
  }

  void collide() {
    if (isTouching("wall")) {
      if (playerinsight == false) {
        direction *= -1;
        setPosition(getX()+direction*5, getY());
        readytochase = true;
      } else if (playerinsight == true) {
        setVelocity(0, 0);
        readytochase = false;
      }
    }
    if (isTouching("player")) {
      if (cheatmode == false) {
        player1.setPosition(spawnX, spawnY);
        playerdied = true;
        lives--;
      }
    }
    if (isTouching("fireball")) {
      hit = true;
      hitnums++;
      if (hitnums >= 5) {
        hitnums = 0;
        settimer = true;
        boodied = true;
        if (checkforpos == false) {
          checkforpos = true;
          posX = getX();
          posY = getY()-25;
        }
        setPosition (1500, 1500);
        setStatic(true);
     }
    }
    if (settimer == true) {
      if (timer > 0) {
        timer--;
      }
      if (timer == 0) {
        setVelocity(0, 0);
        setPosition(posX, posY);
        setStatic(false);
        checkforpos = true;
        settimer = false;
        boodied = false;
        timer = 600;
        spawnmode = true;
      }
    }
    if (boodied == true) {
      if (playerdied == true) {
        setPosition(orgX, orgY);
        setStatic(false);
        checkforpos = true;
        boodied = false;
      }
    }
    if (isTouching("ground")) {
      spawnmode = false;
    }
  }

  void move() {
    if (isTouching("wall") == false) {
      if (playerinsight == false) {
        float vy = getVelocityY();
        setVelocity(speed*direction, vy);
        still = false;
        angry = false;
      } else if (playerinsight == true) {
        if (spawnmode == false) {
          if (readytochase == true) {
            if (player1.getX() > getX()) {
              if (playerfacing == R) {
                setVelocity(160, 0);
                direction = R;
                still = false;
                angry = true;
              } else if (playerfacing == L) {
                setVelocity(0, 0);
                still = true;
                angry = false;
              }
            } else if (player1.getX() < getX()) {
              if (playerfacing == L) {
                setVelocity(-160, 0);
                direction = L;
                still = false;
                angry = true;
              } else if (playerfacing == R) {
                setVelocity(0, 0);
                still = true;
                angry = false;
              }
            }
          }
        }
      }
    }
  }

  void sense() {
    if ((player1.getY() >= getY()-50) && (player1.getY() <= getY()+50)) {
      if ((player1.getX() >= getX()-100) && (player1.getX() <= getX()+100)) {
        playerinsight = true;
      }
    } else {
      playerinsight = false;
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
