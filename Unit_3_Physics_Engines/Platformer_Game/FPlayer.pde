class FPlayer extends FGameObject {
  
  float velocityYtrack, prevY, vy, vx;

  FPlayer() {
    super();
    setPosition(50, 50);
    setRotatable(false);
    setName("player");
    setFillColor(blue);
  }

  void act() {
   playerInteractions();
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
  
  void playerInteractions() {
    if (abs(getVelocityX()) < 150) {
    if (akey) addImpulse (-20, 0);
    if (dkey) addImpulse (20, 0);
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
    if (jumped == true) {
      velocityYtrack = getY() - prevY;
      prevY = getY();
    }
    if (hitGround() == true) {
      jumped = false;
    }
    if (isTouching("portal")) {
      loadingScreen();
      if (currentmap == 0) {
      setPosition(100, 100);
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
    if (touchingWater() == true) {
      playerdied();
    }
  }
  
  void playerdied() {
     if (currentmap == 1) {
      setPosition(100, 150);
      setVelocity(0, 0);
      }
     //playerdied = true;
  }
}
