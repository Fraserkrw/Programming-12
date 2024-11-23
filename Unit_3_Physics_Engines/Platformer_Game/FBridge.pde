class FBridge extends FGameObject {
  
  int timer;
  float transparency = 255;
  boolean starttimer;
  float posX, posY;
  
  FBridge(float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    posX = x*gridSize;
    posY = y*gridSize;
    setName("bridge");
    attachImage(Bridgeblock);
    setStatic(true);
    setSensor(false);
    setRotatable(false);
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
      }
    if (timer <= 480 && timer >= 0) {
     setSensor(true);
     setStatic(false);
     transparency = transparency - 5;
     if (transparency < 0) {
       transparency = 0;
     }
     println(transparency);
     tint (255, transparency);
   }
    if (getY() >= 475) {
     setStatic(true);
    }
    if (timer <= 0) {
     resetBridge();
    }
  }
  
  void resetBridge() {
     setStatic(true);
     setSensor(false);
     setVelocity(0, 0);
     setPosition(posX, posY);
     transparency = 255;
     tint(255, transparency);
     timer = 500;
     starttimer = false;
  }
}
