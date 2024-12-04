class FPlayer extends FGameObject {
  
  float velocityYtrack, prevY, vy, vx;
  PImage[] runningleftimages;
  PImage[] runningrightimages;
  PImage[] idlerightimages;
  PImage[] idleleftimages;
  int i1 = 0;
  int i2 = 0;
  int a1 = 0;
  int a2 = 0;
  float timer;
  float timer1;
  PImage jumpleft, jumpright, idleleft, idleright;
  int facing;
  final int right = 1;
  final int left = 2;

  FPlayer() {
    super();
    setPosition(50, 50);
    spawnX = 50;
    spawnY = 50;
    setRotatable(false);
    setName("player");
    setFillColor(blue);
    timer = 8;
    timer1 = 8;
    facing = right;
    runningleftimages = new PImage[3];
    runningrightimages = new PImage[3];
    idleleftimages = new PImage[2];
    idlerightimages = new PImage[2];
    for (int i = 0; i < 3; i++) {
     runningleftimages[i] = loadImage("imageReverser/runleft"+i+".png");
     runningleftimages[i].resize(gridSize-10, gridSize-10);
    }
    for (int i = 0; i < 3; i++) {
     runningrightimages[i] = loadImage("imageReverser/runright"+i+".png");
     runningrightimages[i].resize(gridSize-10, gridSize-10);
    }
    for (int i = 0; i < 2; i++) {
     idlerightimages[i] = loadImage("imageReverser/idle"+i+".png");
     idlerightimages[i].resize(gridSize-10, gridSize-10);
    }
    for (int i = 0; i < 2; i++) {
     idleleftimages[i] = reverseImage(idlerightimages[i]);
     idleleftimages[i].resize(gridSize-10, gridSize-10);
    }
    jumpleft = loadImage("imageReverser/jump1.png");
    jumpleft.resize(gridSize-10, gridSize-10);
    jumpright = loadImage("imageReverser/jump0.png");
    jumpright.resize(gridSize-10, gridSize-10);
    idleright = loadImage("imageReverser/jump0.png");
    attachImage(idlerightimages[0]);
  }

  void act() {
   playerMoving();
   playerInteractions();
   if (cheatmode == false) {
   playerDangerousInteractions();
   setGrabbable(false);
   }
   if (cheatmode == true) {
   setGrabbable(true);
   }
  }

  boolean hitGround() {
    if (velocityYtrack == 0) {
      return true;
    }
    return false;
  }
  
  boolean touchingWater() {
    ArrayList<FBox> playercontactList = getTouching();
    for (int i = 0; i < playercontactList.size(); i++) {
    FBox boxincontact = playercontactList.get(i);
    if (boxincontact.getName() == "water" && player1.getY() > boxincontact.getY()) {
      return true;
    }
   }
   return false;
  }
  
  void playerMoving() {
    if (abs(getVelocityX()) < 150) {
    if (akey) {
      addImpulse (-20, 0);
      facing = left;
      if (jumped == false) {
      attachImage (runningleftimages[i1]);
      i1++;
      if (i1 == 3) {
      i1 = 0;
      }
     }
    }
    if (dkey) {
      addImpulse (20, 0);
      facing = right;
      if (jumped == false) {
      attachImage (runningrightimages[i2]);
      i2++;
      if (i2 == 3) {
      i2 = 0;
      }
     }
    }
    }
    if (getVelocityX() == 0 && getVelocityY() == 0) {
      if (facing == right) {
        attachImage(idlerightimages[a1]);
        if (timer > 0) {
          timer--;
        } else if (timer == 0) {
          a1++;
          timer = 8;
        }
        if (a1 == 2) {
          a1 = 0;
        }
      } else if (facing == left) {
        attachImage(idleleftimages[a2]);
        if (timer1 > 0) {
          timer1--;
        } else if (timer1 == 0) {
          a2++;
          timer1 = 8;
        }
        if (a2 == 2) {
          a2 = 0;
        }
      }
    }
    if (skiplevel) {
      if (currentmap == 0) {
        setPosition(portal.getX()-10, portal.getY());
      }
    }
    if (wkey == true && jumped == false) {
      setVelocity (vx, -450);
      jumped = true;
    }
    if (abs(getVelocityY()) > 10) {
      if (facing == right) {
        attachImage(jumpright);
      } else if (facing == left) {
        attachImage(jumpleft);
      }
    }
    if (jumped == true) {
      velocityYtrack = getY() - prevY;
      prevY = getY();
    }
    if (hitGround() == true) {
      jumped = false;
    }
  }
  
  void playerInteractions() {
    if (isTouching("portal")) {
      loadingScreen();
      if (currentmap == 0) {
      setPosition(100, 150);
      spawnX = 100;
      spawnY = 150;
      setVelocity(-vx, 0);
      }
      mapchange = true;
    }
    if (isTouching("jumpboost")) {
      if (jumped == false) {
      setVelocity(0, -600);
      }
      jumped = true;
    }
  }
  
  void playerDangerousInteractions() {
    if (touchingWater() == true) {
      playerdied();  
    }
    if (isTouching("lava")) {
      playerdied();
    }
  }
  
  void playerdied() {
     if (currentmap == 1) {
      setPosition(spawnX, spawnY);
      setVelocity(0, 0);
      facing = right;
      }
     //playerdied = true;
  }
}
