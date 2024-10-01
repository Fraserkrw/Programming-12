//Adrian Wong
//September 27th, 2024
//1-4

Button[] myButtons1, myButtons2;
int numsButtons = 2;

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
  
  myButtons1 = new Button[numsButtons];
  myButtons2 = new Button[numsButtons];
  
  myButtons1[0] = new Button("BLUE", 200, 200, 200, 150, blue, white);
  myButtons1[1] = new Button("GREEN", 200, 400, 200, 150, green, white);
  myButtons2[0] = new Button(550, 300, 400, 350, black, white, "Happy Face Button Img.png");
  myButtons2[1] = new Button(width/2, 650, 600, 200, pink, white, "Sad Face Button Img.png");
}

void draw() {
  click();
  
  int i = 0;
  while (i < numsButtons) {
  myButtons1[i].showButton1();
  myButtons1[i].clicked();
  myButtons2[i].showButton2();
  myButtons2[i].clicked();
  i++;
  }
}
