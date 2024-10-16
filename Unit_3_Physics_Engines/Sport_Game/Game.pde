void Game() {
  if (PlayerTurn == Blue) {
    background(blue);
  } else if (PlayerTurn == Red) {
    background(red);
  }
  world.draw();
  addArrow();
}

void gameClicks() {
  if (keyPressed) {
    if (keyCode == LEFT) {
      if (arrowx > width/2-100) {
      arrowx = arrowx - 1;
      }
    }
    if (keyCode == RIGHT) {
      if (arrowx < width/2+100) {
      arrowx = arrowx + 1;
      }
    }
  }
}

void BoxBoundarySetup() {
  //Level1
  FPoly boundary = new FPoly();
  //Vertices
  boundary.vertex(200, 100);
  boundary.vertex(200, 700);
  boundary.vertex(600, 700);
  boundary.vertex(600, 100);
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
  FCircle arrow = new FCircle(10);
  
  //Vertices
  arrow.setPosition(arrowx, (650 + (sqrt(100^2 - (arrowx-width/2)^2))));
  
  //set visuals
  arrow.setStroke(0);
  arrow.setStrokeWeight(5);
  arrow.setFillColor(white);
  
  world.add(arrow);
  
  
}
