class FThwomp extends FGameObject1 {
  
  PImage sleepingThwomp = loadImage("mariosprites/thwomp0.png");
  PImage angryThwomp = loadImage("mariosprites/thwomp1.png");
  boolean sleeping, interactedwithplayer;
  int timer, resettimer;
  float posX, posY;
  
  FThwomp (float x, float y) {
    super();
    setPosition(x*gridSize, y*gridSize+8);
    setVelocity(0, 0);
    posX = x*gridSize;
    posY = y*gridSize+8;
    setName("thwomp");
    setStatic(true);
    setSensor(false);
    setRotatable(false);
    setDensity(2000);
    sleeping = true;
    interactedwithplayer = false;
    timer = 10;
    resettimer = 200;
    attachImage(sleepingThwomp);
    sleepingThwomp.resize(3*gridSize/2, 3*gridSize/2);
    angryThwomp.resize(3*gridSize/2, 3*gridSize/2);
  }
  
  void act() {
   if (player1.getY() > 890) {
    if (player1.getX() >= (getX()-(3*gridSize/2)/2) && player1.getX() <= (getX()+(3*gridSize/2)/2)) {
      attachImage(angryThwomp);
      if (timer > 0) {
        timer--;
      }
      if (timer == 0) {
      setStatic(false);
      if (cheatmode == true) {
      setSensor(true);
      }
      interactedwithplayer = true;
      timer = 10;
      }
   } else {
     attachImage(sleepingThwomp);
     timer = 10;
   }
   if (isTouching("player") && player1.getY() >= getY()+(3*gridSize/2)/2) {
     if (cheatmode == false) {
      if (hardcore == true) {
      playerdied = true;
      player1.setPosition(spawnX, spawnY);
      setPosition(posX, posY);
      setStatic(true);
      attachImage(sleepingThwomp);
      } else if (hardcore == false) {
      playertookthwmpdmg();
      hp = hp - 50;
      }
   }
  }
  if (cheatmode == true) {
    if (getY() >= 950) {
     setStatic(true);
    }
  }
   if (interactedwithplayer == true) {
     if (isTouching("player") == false && (player1.getX() < getX()-(3*gridSize/2)/2 || player1.getX() > getX()+(3*gridSize/2)/2)) {
       if (resettimer > 0) {
        resettimer--;
        println(resettimer);
       }
      if (resettimer == 0) {
        setPosition(posX, posY);
        setStatic(true);
        setSensor(false);
        setVelocity(0, 0);
        resettimer = 200;
        interactedwithplayer = false;
      }
    } else {
      resettimer = 200;
    }
   }
  }
 }
 
  boolean isTouching(String n) {
    ArrayList<FBox> playercontactList = getTouching();
    for (int i = 0; i < playercontactList.size(); i++) {
    FBox boxincontact = playercontactList.get(i);
    if (boxincontact.getName() == n) {
      return true;
    }
   }
   return false;
  }
  
  void playertookthwmpdmg() {
    player1.setVelocity(0, 0);
    player1.setPosition(player1.getX()-75, player1.getY());
  }
}
