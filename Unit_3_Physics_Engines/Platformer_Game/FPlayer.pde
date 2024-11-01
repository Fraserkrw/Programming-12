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
  }

  boolean hitGround() {
    if (velocityYtrack == 0) {
      return true;
    }
    return false;
  }
}
