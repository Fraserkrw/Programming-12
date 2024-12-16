class FBoo extends FGameObject {
  
   int direction = L;
   int speed = 50;
   boolean playerinsight = false;
   
   FBoo (float x, float y) {
     super();
     setPosition(x*gridSize, y*gridSize);
     setRotatable(false);
     setDensity(2000);
   }
   
   void act() {
    println(playerinsight);
    animate();
    collide();
    move();
    sense();
  }
  
  void animate() {
    
  }
  
  void collide() {
    if (isTouching("wall")) {
      direction *= -1;
      setPosition(getX()+direction*2, getY());
    }
  }
  
  void move() {
    if (playerinsight == false) {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
    } else if (playerinsight == true) {
      if (
    }
  }
  
  void sense() {
    if ((player1.getY() >= getY()-50) && (player1.getY() <= getY()+50)) {
      if ((player1.getX() >= getX()-150) && (player1.getX() <= getX()+150)) {
        playerinsight = true;
      }
    } else {
      playerinsight = false;
    }
  }
}
