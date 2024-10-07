//Adrian Wong
//October 4th, 2024
//1-4

ArrayList<Mover> myMovers;

void setup() {
  size (800, 800);
  myMovers = new ArrayList();
}

void draw() {
  background (#067EC6);
  for (int i = 0; i < myMovers.size(); i++) {
    Mover m = myMovers.get(i);
    m.showBody();
    m.act();
    m.showConnections();
    checkforDeletion(i);
   }
  }


void keyPressed() {
  if (keyCode == RIGHT) {
    myMovers.add(new Mover());
  }
  if (keyCode == LEFT) {
    if (myMovers.size() > 0) {
    myMovers.remove(0);
    }
  }
}
  
  void mouseReleased() {
   myMovers.add(new Mover(mouseX, mouseY));
  }
  
  void checkforDeletion(int i) {
   Mover others = myMovers.get(i);
   if (dist(mouseX, mouseY, others.location.x, others.location.y) < others.size/2 && keyPressed && (key == 'D' || key == 'd')) {
     myMovers.remove(i);
     i--;
   }
 }
