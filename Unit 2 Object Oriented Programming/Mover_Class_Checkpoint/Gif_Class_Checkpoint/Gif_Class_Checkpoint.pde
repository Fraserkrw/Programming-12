//Adrian Wong
//October 2, 2024
//1-4

Gif samuraigif, pikachugif1, pikachugif2, pikachugif3, pikachugif4;

void setup() {
  size (800, 800);
  imageMode(CENTER);
  samuraigif = new Gif ("Samurai Gif/frame_", "_delay-0.2s.gif", 9, 8, width/2, height/2, width, height);
  pikachugif1 = new Gif ("Pikachu Gif/frame_", "_delay-0.12s.gif", 10, 8, 500, 600, 100, 100);
  pikachugif2 = new Gif ("Pikachu Gif/frame_", "_delay-0.12s.gif", 10, 8, 700, 600, 100, 100);
  pikachugif3 = new Gif ("Pikachu Gif/frame_", "_delay-0.12s.gif", 10, 8, 600, 600, 100, 100);
  pikachugif4 = new Gif ("Pikachu Gif/frame_", "_delay-0.12s.gif", 10, 8, 650, 700, 100, 100);
}

void draw() {
  samuraigif.show();
  pikachugif1.show();
  pikachugif2.show();
  pikachugif3.show();
  pikachugif4.show();
}
