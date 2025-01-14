class FHammerBro extends FGameObject {

  int frame = 0;
  int timer = 100;
  int direction = L;
  int mapwhencreated = currentmap;
  boolean hammermade = false;
  boolean checkforpos = false;
  boolean thwmpdied, settimer;
  float posX, posY, orgX, orgY;
  int speed = 50;
  PImage hammer = loadImage("mariosprites/hammer.png");
  PImage[] hammerbro;
  FBox hammerobject;
  boolean hit = false;
  int hitnums;
  int hptimer = 300;
  boolean iframes = false;
  int iframestimer = 120;
  boolean blink = false;
  int spawntimer = 600;

  FHammerBro(float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    orgX = x*gridSize;
    orgY = y*gridSize;
    setDensity(2000);
    setName("mob");
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
    hpbar();
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
    if (mapwhencreated == currentmap) {
      if (thwmpdied == false) {
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
            hammerobject.setName("hammer");
            float x = random(-200, 200);
            hammerobject.setVelocity (x, -300);
            world.add(hammerobject);
          }
        }
      }
      if (checkforpos == true) {
        if (hammerTouching()) {
          if (cheatmode == false) {
            if (hardcore == true) {
              playerdied = true;
              lives--;
              player1.setPosition(spawnX, spawnY);
              timer = 100;
              hammermade = false;
              checkforpos = false;
              world.remove(hammerobject);
            } else if (hardcore == false) {
              if (iframes == false) {
                hp = hp - 50;
              }
              iframes = true;
              timer = 100;
              hammermade = false;
              checkforpos = false;
              world.remove(hammerobject);
            }
          }
        }
        if (hammerobject.getY() > 1000) {
          timer = 100;
          hammermade = false;
          checkforpos = false;
          world.remove(hammerobject);
        }
      }
      if (iframes == true) {
        if (iframestimer > 0) {
          iframestimer--;
          //if (iframestimer % 30 == 0) {
          //  blink = !blink;
          //  if (blink == true) {
          //    tint (255, 126);
          //  }
          //  if (blink == false) {
          //    noTint();
          //  }
          //}
        }
        if (iframestimer == 0) {
          iframes = false;
        }
        fill (grey);
        stroke(black);
        rect(100, 120, 170, 50);
        fill(black);
        textFont(PixelFont);
        textSize(30);
        text("IMMUNE", 100, 130);
      }
      if (isTouching("fireball")) {
        hit = true;
        hitnums++;
        if (hitnums >= 5) {
          hitnums = 0;
          settimer = true;
          thwmpdied = true;
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
        if (spawntimer > 0) {
          spawntimer--;
          println(spawntimer);
        }
        if (spawntimer == 0) {
          setVelocity(0, 0);
          setPosition(orgX, orgY);
          setStatic(false);
          checkforpos = true;
          settimer = false;
          thwmpdied = false;
          spawntimer = 600;
        }
      }
      if (thwmpdied == true) {
        if (playerdied == true) {
          setPosition(orgX, orgY);
          setStatic(false);
          checkforpos = true;
          thwmpdied = false;
        }
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
