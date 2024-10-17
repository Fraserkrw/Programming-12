void Game() {
  backgroundchange();
  handlePlayerInput();
  world.draw();
  addArrow();
}

void gameClicks() {

}

void BoxBoundarySetup() {
  //Level1
  FPoly boundary = new FPoly();
  //Vertices
  boundary.vertex(200, 50);
  boundary.vertex(200, 750);
  boundary.vertex(600, 750);
  boundary.vertex(600, 50);
  //Properties
  boundary.setStroke(black);
  boundary.setStrokeWeight(20);
  boundary.setStatic(true);
  boundary.setFillColor(brown);
  boundary.setFriction(0);
  boundary.setGrabbable(false);
  
  //Add to world
  world.add(boundary);
}

void addBall() {
  FCircle ball = new FCircle(50);
  ball.setPosition(width/2, 650);
  
  //set visuals
  ball.setStroke(0);
  ball.setStrokeWeight(5);
  ball.setFillColor(white);
  
  //set physical properties
  ball.setDensity(0.2);
  ball.setFriction(1);
  ball.setRestitution(0.2);
  
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
 }
 
 void keyReleased()   {
   if (keyCode == LEFT) leftkey = false;
   if (keyCode == RIGHT) rightkey = false;
 }
 
 void handlePlayerInput() {
   if (leftkey == true) {
     angle = angle - 0.1;
   }
   if (rightkey == true) {
     angle = angle + 0.1;
   }
 }
 
 void backgroundchange() {
   if (PlayerTurn == Blue) {
    background(blue);
  } else if (PlayerTurn == Red) {
    background(red);
  }
 }
