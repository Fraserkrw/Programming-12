class Button {
  
  //Instance Variables
  int x, y, w, h; //x, y is the center
  boolean clicked;
  color highlight, normal;
  String text;
  PImage img;
  int buttonType;
  
  
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
    buttonType = 1;
  }
  
  Button (int _x, int _y, int _w, int _h, color norm, color high, String _img) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    highlight = high;
    normal = norm;
    clicked = false;
    img = loadImage(_img);
    buttonType = 2;
  }
  
  boolean touchingMouse() {
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      return true;
    }
    return false;
  }
  
  void showButton1() {
    if (touchingMouse()) {
       fill (highlight);
     } else {
       fill (normal);
     }
     stroke(0);
     strokeWeight(4);
     rect(x, y, w, h, 20);
     
     //Text
     if (touchingMouse()) {
       fill (normal);
     } else {
       fill (highlight);
     }
     textSize(w/4);
     text(text, x, y+h/8);
     //image (img, x, y+h/8, 100, 100);
     
     if (mouseReleased && touchingMouse()) {
       clicked = true;
     } else {
       clicked = false;
     }
  }
  
  void showButton2() {
    if (touchingMouse()) {
       fill (highlight);
     } else {
       fill (normal);
     }
     stroke(0);
     strokeWeight(4);
     rect(x, y, w, h, 20);
     
     //Text
     if (touchingMouse()) {
       fill (normal);
     } else {
       fill (highlight);
     }
     textSize(w/4);
     image (img, x-width/16, y-width/16, 100, 100);
     
     if (mouseReleased && touchingMouse()) {
       clicked = true;
     } else {
       clicked = false;
     }
  }
  
  void clicked() {
    if (clicked == true) {
      if (buttonType == 1) {
      background (normal);
    }
    if (buttonType == 2) {
      background(200);
      //img.resize (width, height);
      image (img, 0, 0, width, height);
    }
   }
  }
 }
