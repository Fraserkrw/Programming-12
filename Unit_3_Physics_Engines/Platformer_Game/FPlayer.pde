class FPlayer extends FBox {
  
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
    if (wkey) setVelocity (vx, 100);
  }
}
