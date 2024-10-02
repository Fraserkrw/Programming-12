class Gif {
  
  //Instance Variables
  int x, y, w, h;
  String before, after;
  int frames, framespeed, f;
  PImage[] gif;
  
  //Constructor
  Gif(String _before, String _after, int numFrames, int speed, int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    before = _before;
    after = _after;
    frames = numFrames;
    framespeed = speed;
    f = 0;
    gif = new PImage[frames];
    
    int i = 0; 
    while (i < frames) {
      gif[i] = loadImage(before+i+after);
      i++;
    }
  }
  
  void show() {
    frameRate(framespeed);
    image(gif[f], x, y, w, h);
    f++;
    if (f == frames) {
      f = 0;
    }
  }
}
