class FGameObject extends FBox {
  
  FGameObject() {
    super(gridSize-5, gridSize-5);
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
