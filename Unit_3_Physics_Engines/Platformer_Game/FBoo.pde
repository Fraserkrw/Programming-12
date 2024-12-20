class FBoo extends FGameObject {

  int direction = L;
  int speed = 50;
  boolean playerinsight = false;
  boolean storeinteraction = false;
  boolean playerinteraction = false;
  boolean readytochase = true;
  int timer = 60;
  //boolean touchingboundary = false;

  FBoo (float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    setRotatable(false);
    setDensity(2000);
    setFill(255);
    //zsetSensor(true);
  }

  void act() {
    animate();
    collide();
    move();
    sense();
  }

  void animate() {
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
        //if (direction == L) {
        //  if (player1.getX() < getX()) {
        //    setVelocity(0, 0);
        //  }
        //}
        //if (direction == R) {
        //  if (player1.getX() > getX()) {
        //    setVelocity(0, 0);
        //  }
        //}
      }
    }
  }

  void move() {
    if (isTouching("wall") == false) {
      if (playerinsight == false) {
        float vy = getVelocityY();
        setVelocity(speed*direction, vy);
      } else if (playerinsight == true) {
        if (readytochase == true) {
          if (player1.getX() > getX()) {
            if (playerfacing == R) {
              setVelocity(150, 0);
              direction = R;
            } else if (playerfacing == L) {
              setVelocity(0, 0);
            }
          } else if (player1.getX() < getX()) {
            if (playerfacing == L) {
              setVelocity(-150, 0);
              direction = L;
            } else if (playerfacing == R) {
              setVelocity(0, 0);
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
}
