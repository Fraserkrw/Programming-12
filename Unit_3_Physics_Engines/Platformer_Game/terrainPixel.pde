class terrainPixel extends FBox {
   
  terrainPixel(int x, int y, color pixelcolor) {
    super(gridSize, gridSize);
    setPosition(x*gridSize, y*gridSize);
    setFillColor(pixelcolor);
    setStatic(true);
    setStroke(pixelcolor);
  }
}
