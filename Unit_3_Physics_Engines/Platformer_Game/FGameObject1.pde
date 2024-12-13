class FGameObject1 extends FBox {
  
  final int L = -1;
  final int R = 1;
  
  FGameObject1() {
    super(3*gridSize/2, 3*gridSize/2);
  }
  
  void act() {
    
  }
  
  boolean isTouching(String n) {
    ArrayList<FBox> playercontactList = getTouching();
    for (int i = 0; i < playercontactList.size(); i++) {
    FBox boxincontact = playercontactList.get(i);
    if (boxincontact.getName() == n) {
      return true;
    }
   }
   return false;
  }
}
