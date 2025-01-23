class Fireflies {
  
  PVector location;
  int x, z, fireflyX, fireflyY, fireflyZ;
  int size;
  

  Fireflies() {
    x = int(random(0, 4000)/gridSize);
    z = int(random(0, 4000)/gridSize);
    println("x: "+x+" y: "+z+" ");
    fireflyZ = int(random(520, 890));
    size = 50;
    for (int i = 0; i <= 1; i++) {
      if (map.get(x, z) == darkgrey) {
        fireflyX = (x*gridSize)-2000;
        fireflyY = (z*gridSize)-2000;
      } else if (map.get(x, z) != darkgrey) {
        x = int(random(0, 4000)/gridSize);
        z = int(random(0, 4000)/gridSize);
        i--;
      }
    }
    location = new PVector(fireflyX, fireflyZ, fireflyY);
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
    //println(" "+location.x+" "+location.y+" "+location.z+" ");
  }
}
