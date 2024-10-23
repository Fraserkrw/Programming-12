void Game() {
  backgroundchange();
  handlePlayerInput();
  world.step();
  world.draw();
  if (levelchange == true) {
    if (level >= 2) {
      deleteFromWorld[level-1] = true;
    }
    addLevelObstacles();
    levelchange = false;
  }
  scoreTracking();
  trackVelocity();
  hitGoal();
  if (arrowActive == true) {
  addArrow();
  }
  rectCharge();
  if (checkforBallStopped() == true) {
  turnsCompleted++;
  ballReset();
  }
  objectRotation(); //level4 rotation
}

void gameClicks() {

}

void BoxBoundarySetup() {
  boundary = new FPoly();
  //Vertices
  boundary.vertex(200, 50);
  boundary.vertex(200, 750);
  boundary.vertex(600, 750);
  boundary.vertex(600, 50);
  //Properties
  boundary.setRestitution(0.8);
  boundary.setStroke(black);
  boundary.setStrokeWeight(20);
  boundary.setStatic(true);
  boundary.setFillColor(brown);
  boundary.setFriction(0);
  boundary.setGrabbable(false);
  
  //Add to world
  world.add(boundary);
  
  addBoundaryWalls();
}

void addBoundaryWalls() {
  // Add left wall
  FBox leftWall = new FBox(10, 700);  
  leftWall.setPosition(200, 400);
  leftWall.setStatic(true);
  leftWall.setFill(0, 0, 0, 0);  
  leftWall.setGrabbable(false);
  world.add(leftWall);

  // Add right wall
  FBox rightWall = new FBox(10, 700);
  rightWall.setPosition(600, 400);
  rightWall.setStatic(true);
  rightWall.setFill(0, 0, 0, 0);
  rightWall.setGrabbable(false);
  world.add(rightWall);

  // Add top wall
  FBox topWall = new FBox(400, 10);  
  topWall.setPosition(400, 50);
  topWall.setStatic(true);
  topWall.setFill(0, 0, 0, 0);
  topWall.setGrabbable(false);
  world.add(topWall);

  // Add bottom wall
  FBox bottomWall = new FBox(400, 10);
  bottomWall.setPosition(400, 750);
  bottomWall.setStatic(true);
  bottomWall.setFill(0, 0, 0, 0);
  bottomWall.setGrabbable(false);
  world.add(bottomWall);
}

void addLevelObstacles() {
  //Level 1
  if (level == 1) {
    if (deleteFromWorld[1] == false) {
    level1();
    }
  }
  if (deleteFromWorld[1] == true) {
    obstacle1.setPosition(-2000, -2000);
  }
  
  //Level2
  if (level == 2) {
    if (deleteFromWorld[2] == false) {
    level2();
    }
  }
  if (deleteFromWorld[2] == true) {
    obstacle2.setPosition(-2000, -2000);
    obstacle3.setPosition(-2000, -2000);
  }
  
  //Level 3
  if (level == 3) {
    if (deleteFromWorld[3] == false) {
    level3();
    }
  }
  if (deleteFromWorld[3] == true) {
    obstacle4.setPosition(-2000, -2000);
    obstacle5.setPosition(-2000, -2000);
  }
  
  //Level 4
 if (level == 4) {
    if (deleteFromWorld[4] == false) {
    level4();
    }
  }
  if (deleteFromWorld[4] == true) {
    obstacle6.setPosition(-2000, -2000);
    obstacle7.setPosition(-2000, -2000);
  }
  
   //Level 4
 if (level == 5) {
    if (deleteFromWorld[5] == false) {
    level5();
    }
  }
  if (deleteFromWorld[5] == true) {
    obstacle8.setPosition(-2000, -2000);
    obstacle9.setPosition(-2000, -2000);
  }
}

void addBall() {
  ball = new FCircle(ballD);
  ball.setPosition(width/2, 650);
  
  //set visuals
  ball.setStroke(0);
  ball.setStrokeWeight(8);
  ball.setFillColor(white);
  
  //set physical properties
  ball.setStatic(false);
  ball.setRestitution(0.5);
  ball.setGrabbable(false);
  
  //add to world
  world.add(ball);
}

void addArrow() {
  pushMatrix();
  translate(width/2, 650);
  strokeWeight(5);
  stroke(black);
  
  int r = 80;
  arrowX1 = r * cos(angle);
  arrowY1 = r * sin(angle);
  arrowX2 = r/2 * cos(angle);
  arrowY2 = r/2 * sin(angle);
  arrowX3 = (r+8) * cos(angle);
  arrowY3 = (r+8) * sin(angle);
  arrowX4 = r * cos(angle+0.08);
  arrowY4 = r * sin (angle+0.08);
  arrowX5 = r * cos(angle-0.08);
  arrowY5 = r * sin(angle-0.08);
  
  line(arrowX1, arrowY1, arrowX2, arrowY2);
  triangle(arrowX4, arrowY4, arrowX5, arrowY5, arrowX3, arrowY3);
  popMatrix();
}

void addGoal() {
  goal = new FCircle(40);
  goal.setPosition(width/2, 100);
  
  //set visuals
  goal.setStroke(0);
  goal.setStrokeWeight(5);
  goal.setFillColor(black);
  
  //set properties
  goal.setStatic(true);
  goal.setGrabbable(false);
  goal.setSensor(true);
  
  world.add(goal);
}

boolean hitGoal() {
  ArrayList<FContact> ballcontactList = ball.getContacts();
  for (int i = 0; i < ballcontactList.size(); i++) {
    FContact ballContacts = ballcontactList.get(i);
    if (ballContacts.contains(goal)) {
      return true;
    }
  }
  return false;
}

void scoreTracking() {
  scoreboard();
  if (PlayerTurn == Blue && hitGoal()) {
    Player1Score++;
    ballReset();
    turnsCompleted++;
  }
  if (PlayerTurn == Red && hitGoal()) {
    Player2Score++;
    ballReset();
    turnsCompleted++;
  }
  if (turnsCompleted == 2) {
    level++;
    turnsCompleted = 0;
    levelchange = true;
  }
}

void scoreboard() {
  //Scoreboard
  stroke(0);
  strokeWeight(2);
  fill (101, 101, 101);
  rect(width/2, 25, 70, 25);
  fill(blue);
  textSize(15);
  text(Player1Score, width/2-20, 33);
  line (width/2-5, 25, width/2+5, 25);
  fill(red);
  textSize(15);
  text(Player2Score, width/2+20, 33);
}

void keyPressed() {
    if (keyCode == LEFT) leftkey = true;
    if (keyCode == RIGHT) rightkey = true; 
    if (keyCode == UP) upkey = true;
    if (keyCode == DOWN) downkey = true;
    if (keyCode == 32) spacekey = true; 
    
    //Cheat
    if (key == 'P' || key == 'p') {
      ball.setPosition(width/2, 100);
    }
  }
 
 void keyReleased()   {
   if (keyCode == LEFT) leftkey = false;
   if (keyCode == RIGHT) rightkey = false;
   if (keyCode == UP) upkey = false;
   if (keyCode == DOWN) downkey = false;
   if (keyCode == 32) spacekey = false;
 }
 
 void handlePlayerInput() {
   if (leftkey == true) {
     angle = angle - 0.1;
   }
   if (rightkey == true) {
     angle = angle + 0.1;
   }
   if (upkey == true) {
     if (chargeX <= 80) {
     chargeX = chargeX + 1;
     }
   }
   if (downkey == true) {
     if (chargeX >= 0) {
     chargeX = chargeX - 1;
     }
   }
   if (spacekey == true) {
     if (chargeX > 0) {
     velocityX = (chargeX*20) * cos(angle);
     velocityY = (chargeX*20) * sin(angle);
     ball.setVelocity(velocityX, velocityY);
     chargeX = 0;
     arrowActive = false;
     moving = true;
     }
   }
 }
 
 void backgroundchange() {
   if (PlayerTurn == Blue) {
    background(blue);
  } else if (PlayerTurn == Red) {
    background(red);
  }
 }
 
 void rectCharge() {
   if (moving == false) {
   if (upkey == true | chargeX > 0) {
   stroke(0);
   strokeWeight(5);
   fill(101, 101, 101);
   rect(width/2, 700, 86, 20);
   noStroke();
   fill(255, 255, 0);
   quad(width/2-40, 693, width/2-40, 707, (width/2-40)+chargeX, 707, (width/2-40)+chargeX, 693);
   }
  }
 }
 
 boolean checkforBallStopped() {
   if (abs(velocityX) < 0.05 && abs(velocityY) < 0.05 && moving == true) {
     return true;
   }
   return false;
 }
 
 void ballReset() {
     ball.setPosition(width/2, 650);
     if (PlayerTurn == 1) {
       PlayerTurn = 2;
     } else if (PlayerTurn == 2) {
       PlayerTurn = 1;
     }
     velocityX = 0;
     velocityY = 0;
     ball.setVelocity(0, 0);
     ballD = 40;
     chargeX = 0;
     angle = -PI/2;
     arrowActive = true;
     moving = false;
     hit = false;
 }
 
 void trackVelocity() {
  if (moving == true) {
  // Update velocities based on the change in position
  velocityX = ball.getX() - prevX;
  velocityY = ball.getY() - prevY;

  // Store current position as previous for the next frame
  prevX = ball.getX();
  prevY = ball.getY();
  }
 }
 
 void level1() {
   obstacle1 = new FBox(80, 80);
   obstacle1.setRotation(PI/4);
   obstacle1.setPosition(width/2, 400);
   obstacle1.setStatic(true);
   obstacle1.setFill(0); 
   obstacle1.setGrabbable(false);
   world.add(obstacle1);
 }
 
 void level2() {
   obstacle2 = new FBox(75, 75);
   obstacle3 = new FBox(75, 75);
   obstacle2.setRotation(PI/4);
   obstacle2.setPosition(300, 400);
   obstacle2.setStatic(true);
   obstacle2.setFill(0);  
   obstacle3.setRotation(PI/4);
   obstacle3.setPosition(500, 400);
   obstacle3.setStatic(true);
   obstacle3.setFill(0);  
   obstacle3.setGrabbable(false);
   obstacle2.setGrabbable(false);
   world.add(obstacle2);
   world.add(obstacle3);
 }
 
 void level3() {
   obstacle4 = new FBox (75, 75);
   obstacle5 = new FBox (75, 75);
   obstacle4.setRotation(PI/4);
   obstacle5.setRotation(PI/4);
   obstacle4.setPosition(width/2, 500);
   obstacle5.setPosition(width/2, 250);
   obstacle4.setFill(black);
   obstacle5.setFill(black);
   obstacle4.setStatic(true);
   obstacle5.setStatic(true);
   obstacle4.setGrabbable(false);
   obstacle5.setGrabbable(false);
   world.add(obstacle4);
   world.add(obstacle5);
 }
 
 void level4() {
   obstacle6 = new FCircle(30);
   obstacle6.setPosition(width/2, 400);
   obstacle6.setFriction(0);
   obstacle6.setFill(black);
   obstacle6.setGrabbable(false);
   obstacle6.setStatic(true);
   obstacle7 = new FPoly();
   obstacle7.vertex(250, 395);
   obstacle7.vertex(250, 405);
   obstacle7.vertex(550, 405);
   obstacle7.vertex(550, 395);
   obstacle7.setFill(black);
   obstacle7.setGrabbable(false);
   obstacle7.setStatic(false);
   obstacle7.setFriction(0);
   obstacle7.setDensity(Integer.MAX_VALUE);
   obstacle7.setRotatable(true);
   
   world.add(obstacle6);
   world.add(obstacle7);
 }
 
 void level5() {
   obstacle8 = new FPoly();
   obstacle8.vertex(200, 395);
   obstacle8.vertex(200, 405);
   obstacle8.vertex(375, 405);
   obstacle8.vertex(375, 395);
   obstacle8.setFill(black);
   obstacle8.setGrabbable(false);
   obstacle8.setStatic(false);
   obstacle8.setFriction(0);
   obstacle8.setDensity(Integer.MAX_VALUE);
   obstacle8.setRotatable(true);
   
   obstacle9 = new FPoly();
   obstacle9.vertex(425, 395);
   obstacle9.vertex(425, 405);
   obstacle9.vertex(600, 405);
   obstacle9.vertex(600, 395);
   obstacle9.setFill(black);
   obstacle9.setGrabbable(false);
   obstacle9.setStatic(false);
   obstacle9.setFriction(0);
   obstacle9.setDensity(Integer.MAX_VALUE);
   obstacle9.setRotatable(true);
   
   world.add(obstacle8);
   world.add(obstacle9);
 }
 
 void objectRotation() {
   if (level == 4 && obstacle7 != null) {
   obstacle7.setAngularVelocity(5);
   } 
   if (level == 5 && obstacle8 != null && obstacle9 != null ) {
   obstacle8.setAngularVelocity(-5);
   obstacle9.setAngularVelocity(5);
   }
 }
