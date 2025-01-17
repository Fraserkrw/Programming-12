void controlCamera() {
  if (wkey && canMoveForward()) {
    eyeX = eyeX+cos(leftRightHeadAngle)*20;
    eyeZ = eyeZ+sin(leftRightHeadAngle)*20;
  }
  if (skey && canMoveBack()) {
    eyeX = eyeX-cos(leftRightHeadAngle)*20;
    eyeZ = eyeZ-sin(leftRightHeadAngle)*20;
  }
  if (akey && canMoveLeft()) {
    eyeX = eyeX-cos(leftRightHeadAngle+PI/2)*20;
    eyeZ = eyeZ-sin(leftRightHeadAngle+PI/2)*20;
  }
  if (dkey && canMoveRight()) {
    eyeX = eyeX+cos(leftRightHeadAngle+PI/2)*20;
    eyeZ = eyeZ+sin(leftRightHeadAngle+PI/2)*20;
  }
  if (upkey) {
    eyeY = eyeY - 10;
  }
  if (downkey) {
    eyeY = eyeY + 10;
  }

  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.005;
  }

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;

  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300;

  if (mouseX > width-2) {
    skipFrame = true;
    rbt.mouseMove(3, mouseY);
  } else if (mouseX < 2) {
    skipFrame = true;
    rbt.mouseMove(width-3, mouseY);
  } else {
    skipFrame = false;
  }
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}

boolean canMoveForward() {
  float forwardX, forwardY, forwardZ, leftX, leftZ, rightX, rightZ;
  int mapX, mapY, mapXLeft, mapYLeft, mapXRight, mapYRight;
  
  forwardX = eyeX + cos(leftRightHeadAngle)*150;
  forwardZ = eyeZ + sin(leftRightHeadAngle)*150;
  forwardY = eyeY;
  leftX = eyeX + cos(leftRightHeadAngle-radians(20))*150;
  leftZ = eyeZ + sin(leftRightHeadAngle-radians(20))*150;
  rightX = eyeX + cos(leftRightHeadAngle+radians(20))*150;
  rightZ = eyeZ + sin(leftRightHeadAngle+radians(20))*150;
  
  mapX = int(forwardX+2000)/gridSize;
  mapY = int(forwardZ+2000)/gridSize;
  mapXLeft = int(leftX+2000)/gridSize;
  mapYLeft = int(leftZ+2000)/gridSize;
  mapXRight = int(rightX+2000)/gridSize;
  mapYRight = int(rightZ+2000)/gridSize;
  
  if (map.get(mapX, mapY) == darkgrey && map.get(mapXLeft, mapYLeft) == darkgrey && map.get(mapXRight, mapYRight) == darkgrey) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  float leftX, leftY, leftZ;
  int mapX, mapY;
  
  leftX = eyeX-cos(leftRightHeadAngle+PI/2)*150;
  leftZ = eyeZ-sin(leftRightHeadAngle+PI/2)*150;
  
  mapX = int(leftX+2000)/gridSize;
  mapY = int(leftZ+2000)/gridSize;
  
  if (map.get(mapX, mapY) == darkgrey) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float rightX, rightY, rightZ;
  int mapX, mapY;
  
  rightX = eyeX+cos(leftRightHeadAngle+PI/2)*150;
  rightZ = eyeZ+sin(leftRightHeadAngle+PI/2)*150;
  
  mapX = int(rightX+2000)/gridSize;
  mapY = int(rightZ+2000)/gridSize;
  
  if (map.get(mapX, mapY) == darkgrey) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBack() {
  float backX, backY, backZ;
  int mapX, mapY;
  
  backX = eyeX-cos(leftRightHeadAngle)*156;
  backZ = eyeZ-sin(leftRightHeadAngle)*150 ;
  
  mapX = int(backX+2000)/gridSize;
  mapY = int(backZ+2000)/gridSize;
  
  if (map.get(mapX, mapY) == darkgrey) {
    return true;
  } else {
    return false;
  }
}
