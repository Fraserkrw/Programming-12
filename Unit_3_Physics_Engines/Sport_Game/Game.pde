void Game() {
  backgroundchange();
  handlePlayerInput();
  world.step();
  world.draw();
  if (levelchange == true) {
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
    level1();
  }
  //Level2
  if (level == 2) {
    level2();
  }
}

void addBall() {
  ball = new FCircle(40);
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
   if (abs(velocityX) < 0.02 && abs(velocityY) < 0.02 && moving == true) {
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
     chargeX = 0;
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
   FBox obstacle1 = new FBox(80, 80);
   obstacle1.setRotation(PI/4);
   obstacle1.setPosition(width/2, 400);
   obstacle1.setStatic(true);
   obstacle1.setFill(0);  
   world.add(obstacle1);
 }
 
 void level2() {
   FBox obstacle2 = new FBox(50, 50);
   FBox obstacle3 = new FBox(50, 50);
   obstacle2.setRotation(PI/4);
   obstacle2.setPosition(300, 400);
   obstacle2.setStatic(true);
   obstacle2.setFill(0);  
   obstacle3.setRotation(PI/4);
   obstacle3.setPosition(500, 400);
   obstacle3.setStatic(true);
   obstacle3.setFill(0);  
   world.add(obstacle2);
   world.add(obstacle3);
 }
