class Button {
  
  //Instance Variables
  int x, y, w, h; //x, y is the center
  boolean clicked;
  color highlight, normal;
  String text;
  
  //Constructor
  Button (String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }
  
  void show() {
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
       fill (highlight);
     } else {
       fill (normal);
     }
     stroke(0);
     strokeWeight(4);
     rect(x, y, w, h, 20);
     
     //Text
     if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
       fill (normal);
     } else {
       fill (highlight);
     }
     textSize(w/4);
     text(text, x, y);
     
     if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
       clicked = true;
     } else {
       clicked = false;
     }
  }
  
  void clicked() {
    if (clicked == true) {
      background (normal);
    }
  }
}