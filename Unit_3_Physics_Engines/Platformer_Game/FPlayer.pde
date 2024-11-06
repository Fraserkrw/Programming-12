class FPlayer extends FBox {

  float velocityYtrack, prevY;

  FPlayer() {
    super(gridSize-5, gridSize-5);
    setPosition(50, 50);
    setFillColor(blue);
  }

  void act() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (akey) setVelocity (-150, vy);
    if (dkey) setVelocity (150, vy);
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
      if (currentmap == 0) {
      setPosition(100, 100);
      }
      mapchange = true;
    }
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
}
