//Adrian Wong
//1-4
//September 9th, 2024

void setup() {
  size(800, 800);
  background (162, 61, 252);
}

void draw() {
  car(400, 400, 1);
  car(200, 200, 0.5);
  car(600, 600, 0.25);
}

void car(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  carbody();
  tires();
  window();
  carlights();
  popMatrix();
}

void carbody() {
  noStroke();
  fill (18, 152, 252);
  rect (-100, 0, 50, 50); //front
  rect (-50, -50, 125, 100); //main
  rect (75, 0, 25, 50); //back
}

void tires() {
  fill (51, 52, 49);
  ellipse (-50, 50, 40, 40); //main wheel body
  ellipse (50, 50, 40, 40);
  fill (119, 122, 124);
  ellipse (-50, 50, 20, 20);
  ellipse (50, 50, 20, 20);
}

void window() {
  fill (160, 206, 240);
  rect (-40, -40, 40, 40);
  rect (20, -40, 40, 40);
}

void carlights() {
  fill (244, 250, 91);
  ellipse (-93, 15, 10, 20); //front headlight
  ellipse (93, 15, 10, 20); //rear light
  fill (244, 250, 91, 10);
  triangle (-200, -20, -200, 50, -93, 15);
}
