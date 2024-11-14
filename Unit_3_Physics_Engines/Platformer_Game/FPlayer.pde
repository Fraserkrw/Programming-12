class FPlayer extends FBox {

  float velocityYtrack, prevY, vy, vx;

  FPlayer() {
    super(gridSize-5, gridSize-5);
    setPosition(50, 50);
    setRotatable(false);
    setFillColor(blue);
  }

  void act() {
   movementMechanics();
   handlePortalInput();
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
     ArrayList<FBox> playercontactList = getTouching();
    for (int i = 0; i < playercontactList.size(); i++) {
    FBox boxincontact = playercontactList.get(i);
    if (boxincontact.getName() == "jumpboost") {
      return true;
    }
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
  
  void movementMechanics() {
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
    if (touchingPortal() == true) {
      loadingScreen();
      if (currentmap == 0) {
      setPosition(100, 100);
      setVelocity(-vx, 0);
      }
      mapchange = true;
    }
    if (touchingJumpBoost() == true) {
      if (jumped == false) {
      setVelocity(0, -600);
      }
      jumped = true;
    }
    if (touchingWater()) {
      if (currentmap == 1) {
      setPosition(100, 150);
      setVelocity(0, 0);
      }
    }
  }
  
  void handlePortalInput() {
     if (touchingPortal() == true) {
      loadingScreen();
      if (currentmap == 0) {
      setPosition(100, 100);
      setVelocity(-vx, 0);
      }
      mapchange = true;
    }
  }
}
