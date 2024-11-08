class FPlayer extends FBox {

  float velocityYtrack, prevY, vy, vx;

  FPlayer() {
    super(gridSize-5, gridSize-5);
    setPosition(50, 50);
    setFillColor(blue);
  }

  void act() {
   movementMechanics();
   handleBlockInput();
  }

  boolean hitGround() {
    if (velocityYtrack == 0) {
      return true;
    }
    return false;
  }
  
  boolean touchingPortal() {
    ArrayList<FContact> playercontactList = getContacts();
    for (int i = 0; i < playercontactList.size(); i++) {
      FContact playerContacts = playercontactList.get(i);
      if (playerContacts.contains(portal)) {
        return true;
      }
    }
   return false;
  }
  boolean touchingJumpBoost() {
    ArrayList<FContact> playercontactList = getContacts();
    for (int i = 0; i < playercontactList.size(); i++) {
      FContact playerContacts = playercontactList.get(i);
      if (playerContacts.contains(jumpboost)) {
        return true;
      }
    }
   return false;
  }
  
  void movementMechanics() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (akey) setVelocity (-150, vy);
    if (dkey) setVelocity (150, vy);
    if (skiplevel) {
      if (currentmap == 0) {
        setPosition(portal.getX()-10, portal.getY());
      }
    }
    if (wkey == true && jumped == false) {
      setVelocity (vx, 20000);
      jumped = true;
    }
    if (jumped == true) {
      velocityYtrack = getY() - prevY;
      prevY = getY();
    }
    if (hitGround() == true) {
      jumped = false;
    }
    if (touchingPortal() == true) {
      loadingScreen();
      if (currentmap == 0) {
      setPosition(100, 100);
      setVelocity(-vx, 0);
      }
      mapchange = true;
    }
    if (touchingJumpBoost() == true) {
      setVelocity(0, 10000);
    }
  }
  
  void handleBlockInput() {
     if (touchingPortal() == true) {
      loadingScreen();
      if (currentmap == 0) {
      setPosition(100, 100);
      setVelocity(-vx, 0);
      }
      mapchange = true;
    }
    if (touchingJumpBoost() == true) {
      setVelocity(vx, 10000);
    }
  }
}
