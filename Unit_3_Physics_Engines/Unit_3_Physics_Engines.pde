//Adrian Wong
//October 10th, 2024
//1-4

import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//Cloud Variables
int cloud1x = 50;
int cloud1y = 100;
int cloud2x = width-100;
int cloud2y = 100;

//assets
PImage redBird;

FPoly leftPlatform; 
FPoly bucketPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  fullScreen();
  
  //load resources
  redBird = loadImage("red-bird.png");

  //initialise world
  makeWorld();

  //add terrain to world
  makeLeftPlatform();
  makeRightPlatform();
  makeBucketPlatform();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeLeftPlatform() {
  leftPlatform = new FPoly();

  //plot the vertices of this platform
  leftPlatform.vertex(-100, height*.1);
  leftPlatform.vertex(width*0.4, height*0.4);
  leftPlatform.vertex(width*0.4, height*0.4+100);
  leftPlatform.vertex(-100, height*0.1+100);

  // define properties
  leftPlatform.setStatic(true);
  leftPlatform.setFillColor(brown);
  leftPlatform.setFriction(0.1);

  //put it in the world
  world.add(leftPlatform);
}

//===========================================================================================

void makeRightPlatform() {
  bucketPlatform = new FPoly();

  //plot the vertices of this platform
  bucketPlatform.vertex(width+100, height*0.1);
  bucketPlatform.vertex(width*0.6, height*0.4);
  bucketPlatform.vertex(width*0.6, height*0.4+100);
  bucketPlatform.vertex(width+100, height*0.1+100);

  // define properties
  bucketPlatform.setStatic(true);
  bucketPlatform.setFillColor(brown);
  bucketPlatform.setFriction(0);

  //put it in the world
  world.add(bucketPlatform);
}

void makeBucketPlatform() {
  bucketPlatform = new FPoly();

  //plot the vertices of this platform
  bucketPlatform.vertex(width*0.8, height*0.6);
  bucketPlatform.vertex(width*0.8-100, height*0.6);
  bucketPlatform.vertex(width*0.6, height*0.85);
  bucketPlatform.vertex(width*0.4, height*0.85);
  bucketPlatform.vertex(width*0.2+100, height*0.6);
  bucketPlatform.vertex(width*0.2, height*0.6);
  bucketPlatform.vertex(width*0.4, height*0.99);
  bucketPlatform.vertex(width*0.6, height*0.99);
  

  // define properties
  bucketPlatform.setStatic(true);
  bucketPlatform.setFillColor(brown);
  bucketPlatform.setFriction(0);

  //put it in the world
  world.add(bucketPlatform);
}


//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  if (frameCount % 60 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }
  world.step();  //get box2D to calculate all the forces and new positions
  makeCloud2();
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  makeCloud1();
}


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(50, 50);
  box.setPosition(random(width), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);
  box.attachImage("

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(0.25);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}

void makeCloud1() {
  noStroke();
  circle(cloud1x, cloud1y, 50);
  circle(cloud1x+25, cloud1y-25, 50);
  circle(cloud1x, cloud1y+25, 50);
  circle(cloud1x+50, cloud1y, 50);
  circle(cloud1x+30, cloud1y+30, 50);
  circle(cloud1x+70, cloud1y+30, 50);
  circle(cloud1x+70, cloud1y-30, 50);
  circle(cloud1x+90, cloud1y, 50);
  
  cloud1x = cloud1x + 1;
  if (cloud1x > width) {
    cloud1x = -100;
  }
}

void makeCloud2() {
  noStroke();
  circle(cloud2x, cloud2y, 50);
  circle(cloud2x+25, cloud2y-25, 50);
  circle(cloud2x, cloud2y+25, 50);
  circle(cloud2x+50, cloud2y, 50);
  circle(cloud2x+30, cloud2y+30, 50);
  circle(cloud2x+70, cloud2y+30, 50);
  circle(cloud2x+70, cloud2y-30, 50);
  circle(cloud2x+90, cloud2y, 50);
  
  cloud2x = cloud2x - 1;
  if (cloud2x < 0) {
    cloud2x = width+100;
  }
}
