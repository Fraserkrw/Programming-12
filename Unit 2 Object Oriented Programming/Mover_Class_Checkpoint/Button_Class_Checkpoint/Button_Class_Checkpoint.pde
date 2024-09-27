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
  
  myButtons[0] = new Button("BLUE", 200, 200, 200, 150, blue, white);
  myButtons[1] = new Button("GREEN", 200, 400, 200, 150, green, white);
  myButtons[2] = new Button("BLACK", 550, 300, 400, 350, black, white);
  myButtons[3] = new Button("PINK", width/2, 650, 600, 200, pink, white);
}

void draw() {
  click();
  
  int i = 0;
  while (i < numsButtons) {
  myButtons[i].show();
  myButtons[i].clicked();
  i++;
  }
}
