//Adrian Wong
//January 6, 2025
//1-4

float rotx, roty;

void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(255);
  cube(width/2, height/2, 0, #ff0000, 200);
  cube(200, 200, 0, #0000ff, 200);
  cube(600, 600, 0, #0ff000, 200);
  cube(600, 200, 0, #ffff00, 200);
  cube(200, 600, 0, #0000ff, 200);
  ball(100, 100, 0, #000ff0, 200);
  ball(700, 700, 0, #fff000, 200);
  ball(700, 100, 0, #00ff00, 200);
  ball(100, 700, 0, #f00000, 200);
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  fill(c);
  stroke(0);
  strokeWeight(5);
  box(size); //W H D
  popMatrix();
}

void ball(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  fill(c);
  stroke(0);
  strokeWeight(3);
  sphere(size);
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
