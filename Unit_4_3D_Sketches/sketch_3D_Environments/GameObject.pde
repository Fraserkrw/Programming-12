class GameObject {
  PVector location;
  float size;
  float lives;
  
  GameObject() {
    location = new PVector(0, 0, 0);
    size = 10;
    lives = 1;
  }
  
  GameObject(float x, float y, float z, float s) {
    location = new PVector(x, y, z);
    size = s;
    lives = 1;
  }
  
  void show() {
   pushMatrix();
   translate(location.x, location.y, location.z);
   fill(white);
   stroke(100);
   box(size);
   popMatrix();
  }
  
  void act() {
    
  }
}
