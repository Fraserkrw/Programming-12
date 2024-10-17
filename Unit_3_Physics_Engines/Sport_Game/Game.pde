void Game() {
  backgroundchange();
  handlePlayerInput();
  world.step();
  world.draw();
  trackVelocity();
  if (arrowActive == true) {
  addArrow();
  }
  rectCharge();
  ballReset();
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
  world.add(leftWall);

  // Add right wall
  FBox rightWall = new FBox(10, 700);
  rightWall.setPosition(600, 400);
  rightWall.setStatic(true);
  rightWall.setFill(0, 0, 0, 0);
  world.add(rightWall);

  // Add top wall
  FBox topWall = new FBox(400, 10);  
  topWall.setPosition(400, 50);
  topWall.setStatic(true);
  topWall.setFill(0, 0, 0, 0);
  world.add(topWall);

  // Add bottom wall
  FBox bottomWall = new FBox(400, 10);
  bottomWall.setPosition(400, 750);
  bottomWall.setStatic(true);
  bottomWall.setFill(0, 0, 0, 0);
  world.add(bottomWall);
}

void addLevelObstacles() {
  
}

void addBall() {
  ball = new FCircle(50);
  ball.setPosition(width/2, 650);
  
  //set visuals
  ball.setStroke(0);
  ball.setStrokeWeight(5);
  ball.setFillColor(white);
  
  //set physical properties
  ball.setStatic(false);
  ball.setRestitution(0.5);
  
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
     hit = true;
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
 
 boolean checkforBallStopped() {
   if (abs(velocityX) < 0.01 && abs(velocityY) < 0.01 && hit == true) {
     return true;
   }
   return false;
 }
 
 void ballReset() {
   if (checkforBallStopped() == true) {
     ball.setPosition(width/2, 650);
     if (PlayerTurn == 1) {
       PlayerTurn = 2;
     } else if (PlayerTurn == 2) {
       PlayerTurn = 1;
     }
     velocityX = 0;
     velocityY = 0;
     chargeX = 0;
     arrowActive = true;
     hit = false;
   }
 }
 
 void trackVelocity() {
  if (hit == true) {
  // Update velocities based on the change in position
  velocityX = ball.getX() - prevX;
  velocityY = ball.getY() - prevY;

  // Store current position as previous for the next frame
  prevX = ball.getX();
  prevY = ball.getY();
  }
 }
