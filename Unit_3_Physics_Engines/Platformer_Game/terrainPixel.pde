class basicterrainPixel extends FBox {
   
  basicterrainPixel(int x, int y, color pixelcolor, float bounciness, int type) {
    super(gridSize, gridSize);
    setPosition(x*gridSize, y*gridSize);
    setFriction(1);
    setRestitution(bounciness);
    setFillColor(pixelcolor);
    setGrabbable(false);
    setStatic(true);
    setStroke(pixelcolor);
    setName("ground");
    if (type == 1) {
    setSensor(true);
    setName("wall");
    setNoStroke();
    setNoFill();
    }
  }
  basicterrainPixel(int x, int y, String _img, float frictionamount, int type) {
    super(gridSize, gridSize);
    setPosition(x*gridSize, y*gridSize);
    setFriction(frictionamount);
    setGrabbable(false);
    if (type == 0) {
    setName("ground");
    }
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
    if (type == 4) {
    setName("portal");
    }
    if (type == 5) {
    setSensor(true);
    setName("ladder");
    }
    PImage img = loadImage(_img);
    img.resize(gridSize, gridSize);
    attachImage(img);
    setStatic(true);
  }
}
