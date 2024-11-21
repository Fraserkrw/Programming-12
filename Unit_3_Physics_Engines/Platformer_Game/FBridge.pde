class FBridge extends FGameObject {
  
  int timer;
  boolean starttimer;
  float posX, posY;
  
  FBridge(float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    posX = x*gridSize;
    posY = y*gridSize;
    setName("bridge");
    attachImage(bridge);
    setStatic(true);
    setFriction(0.2);
    timer = 120;
    starttimer = false;
  }
  
  void act() {
    if (isTouching("player")) {
      starttimer = true;
    }
    if (starttimer == true) {
      timer--;
      }
    if (timer == 200) {
     setStatic(false);
     setSensor(true);
     }
    if (timer == 0) {
     setPosition(posX, posY);
     setStatic(true);
     setSensor(false);
     timer = 220;
     starttimer = false;
     }
  }
}
