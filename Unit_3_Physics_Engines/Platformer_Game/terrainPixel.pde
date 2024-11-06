class terrainPixel extends FBox {
   
  terrainPixel(int x, int y, color pixelcolor) {
    super(gridSize, gridSize);
    setPosition(x*gridSize, y*gridSize);
    setFillColor(pixelcolor);
    setStatic(true);
    setStroke(pixelcolor);
  }
  terrainPixel(int x, int y, String _img) {
    super(gridSize, gridSize);
    setPosition(x*gridSize, y*gridSize);
    PImage img = loadImage(_img);
    img.resize(gridSize, gridSize);
    attachImage(img);
    setStatic(true);
  }
}
