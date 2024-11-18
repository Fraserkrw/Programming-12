class terrainPixel extends FBox {
   
  terrainPixel(int x, int y, color pixelcolor, float bounciness) {
    super(gridSize, gridSize);
    setPosition(x*gridSize, y*gridSize);
    setRestitution(bounciness);
    setFillColor(pixelcolor);
    setGrabbable(false);
    setStatic(true);
    setStroke(pixelcolor);
  }
  terrainPixel(int x, int y, String _img, float frictionamount, int type) {
    super(gridSize, gridSize);
    setPosition(x*gridSize, y*gridSize);
    setFriction(frictionamount);
    setGrabbable(false);
    if (type == 1) {
    setName("jumpboost");
    setRestitution(1);
    }
    if (type == 2) {
    setSensor(true);
    setName("water");
    }
    if (type == 3) {
    setSensor(true);
    setName("treePixels");
    }
    PImage img = loadImage(_img);
    img.resize(gridSize, gridSize);
    attachImage(img);
    setStatic(true);
  }
}
