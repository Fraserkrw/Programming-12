class FLava extends FGameObject {
  
  PImage[] lava;
  int timer;
  int a = (int) random(0, 6);
  
  FLava(float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    setStatic(true);
    setSensor(true);
    setName("lava");
    timer = 8;
    lava = new PImage[6];
    for (int i = 0; i < 6; i++) {
     lava[i] = loadImage("lava"+i+".png");
    }
  }
  
  void act() {
    lava[a].resize(gridSize, gridSize);
    attachImage(lava[a]);
    if (timer > 0) {
      timer--;
    }
    if (timer == 0) {
      a++;
      timer = 8;
    }
    if (a == 6) {
    a = 0;
    }
  }
}
