//Adrian Wong
//September 27th, 2024
//1-4

Button[] myButtons;
int numsButtons = 4;

//Color
color blue = #0700FA;
color green = #158100;
color pink = #FC00CF;
color yellow = #F3FC05;
color black = #030303;
color white = #FFFFFF;

boolean mouseReleased;
boolean wasPressed;

void setup() {
  size (800, 800);
  rectMode (CENTER);
  textAlign (CENTER);
  
  myButtons = new Button[numsButtons];
  
  myButtons[0] = new Button("BLUE", 200, 200, 200, 200, blue, white);
}

void draw() {
  click();
  
  myButtons[0].show();
  myButtons[0].clicked();
}
