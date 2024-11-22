class FBridge extends FGameObject {
  
  int timer;
  float transparency = 0;
  boolean starttimer;
  float posX, posY;
  
  FBridge(float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    posX = x*gridSize;
    posY = y*gridSize;
    setName("bridge");
    tint(255, transparency);
    attachImage(Bridgeblock);
    setStatic(true);
    setSensor(false);
    setFriction(0.2);
    timer = 500;
    starttimer = false;
  }
  
  void act() {
    if (isTouching("player")) {
      starttimer = true;
    }
    if (starttimer == true) {
      timer--;
      //println(timer);
      }
    if (timer <= 470 && timer >= 0) {
     setSensor(true);
     setStatic(false);
     transparency = transparency + 5;
     }
    if (getY() >= 1000) {
     setStatic(true);
    }
    if (timer <= 0) {
     println("reached");
     setStatic(true);
     setSensor(false);
     setVelocity(0, 0);
     setPosition(posX, posY);
     timer = 500;
     starttimer = false;
     }
  }
}
