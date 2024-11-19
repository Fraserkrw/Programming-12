void Game() {
  if (currentmap == 0) {
  background(brown);
  } else if (currentmap == 1) {
  background(darkbrown);
  }
  manageMaps();
  drawWorld();
  loadPlayerMovement();
}

void gameClicks() {
  
}

void drawWorld() {
  pushMatrix();
  if (zoomout == false) {
  if (player1.getX() > 183.78 && player1.getX() < 807.6) {
  translate(-player1.getX()*zoom+width/2, -player1.getY()*zoom+height/2);
  } else if (player1.getX() < 183.78) {
  translate(-183.78*zoom+width/2, -player1.getY()*zoom+height/2);
  } else if (player1.getX() > 807.6) {
  translate(-807.6*zoom+width/2, -player1.getY()*zoom+height/2);
  }
  }
  if (zoomout == true) {
    translate (5, 5);
    scale(0.8);
  } else if (zoomout == false) {
    scale(zoom);
  }
  world.step();
  world.draw();
  popMatrix();
}

void loadWorld(PImage img) {
  if (currentmap == 0) {
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == green || c == black) {
        terrainPixels.add(new terrainPixel(x, y, c, 0.1));
        FBox pixel = terrainPixels.get(pixelcount);
        world.add(pixel);
        pixelcount++;
      }
      if (c == maroon) {
        terrainPixels.add(new terrainPixel(x, y, "teleporterblock.png", 0, 0));
        portal = terrainPixels.get(pixelcount);
        world.add(portal);
        pixelcount++;
      }
    }
  }
 }
 
if (currentmap == 1) {
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 800);
  world.setEdges(-20, 0, 962, 992);
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      //color cbelow = img.get(x, y+1);
      color leftblock = img.get(x-1, y);
      color rightblock = img.get(x+1, y);
      if (c == brown) {
        terrainPixels.add(new terrainPixel(x, y, "obsidianblocktexture.jpg", 0, 0));
        FBox pixel = terrainPixels.get(pixelcount);
        world.add(pixel);
        pixelcount++;
      }
      if (c == black) {
        terrainPixels.add(new terrainPixel(x, y, "stoneblocktexture.jpg", 1, 0));
        FBox pixel = terrainPixels.get(pixelcount);
        world.add(pixel);
        pixelcount++;
      }
      if (c == lightgreen && leftblock == green && rightblock == lightgreen) {
        terrainPixels.add(new terrainPixel(x, y, "treetop_w.png", 0, 3));
        FBox treepixel = terrainPixels.get(pixelcount);
        world.add(treepixel);
        pixelcount++;
      }
      if (c == lightgreen && leftblock == lightgreen && rightblock == lightgreen) {
        terrainPixels.add(new terrainPixel(x, y, "tree_intersect.png", 0, 3));
        FBox treepixel = terrainPixels.get(pixelcount);
        world.add(treepixel);
        pixelcount++;
      }
      if (c == lightgreen && leftblock == lightgreen && rightblock == green) {
        terrainPixels.add(new terrainPixel(x, y, "treetop_e.png", 0, 3));
        FBox treepixel = terrainPixels.get(pixelcount);
        world.add(treepixel);
        pixelcount++;
      }
      if (c == lightgrey) {
        terrainPixels.add(new terrainPixel(x, y, "tree_trunk.png", 0, 3));
        FBox treepixel = terrainPixels.get(pixelcount);
        world.add(treepixel);
        pixelcount++;
      }
      if (c == orange) {
        terrainPixels.add(new terrainPixel(x, y, "jumpboostarrow.png", 0, 1));
        FBox jumpboost = terrainPixels.get(pixelcount);
        world.add(jumpboost);
        pixelcount++;
      }
      if (c == yellow) {
       terrainPixels.add(new terrainPixel(x, y, "water1.png", 0, 2));
       FBox water = terrainPixels.get(pixelcount);
       world.add(water);
       pixelcount++;
      }
      if (c == grey) {
      terrainPixels.add(new terrainPixel(x, y, "iceblock.jpg", 0, 0));
      FBox ice = terrainPixels.get(pixelcount);
      world.add(ice);
      pixelcount++;
      }
      if (c == pink) {
      terrainPixels.add(new terrainPixel(x, y, "sandblocktexture.jpg", 1, 4));
      FBox sand = terrainPixels.get(pixelcount);
      world.add(sand);
      pixelcount++;
      }
      if (c == maroon) {
        terrainPixels.add(new terrainPixel(x, y, "teleporterblock.png", 0, 0));
        portal = terrainPixels.get(pixelcount);
        world.add(portal);
        pixelcount++;
      }
    }
  }
 }
}
 
 


void loadPlayer() {
  player1 = new FPlayer();
  world.add(player1);
}

void loadPlayerMovement() {
  player1.act();
}

void manageMaps() {
  if (setMap == true) {
    loadWorld(maps[currentmap]);
    loadPlayer();
    setMap = false;
  }
  if (mapchange == true) {
    pixelcount = 0;
    terrainPixels.clear();
    currentmap++;
    loadWorld(maps[currentmap]);
    world.add(player1);
    mapchange = false;
  }
}

void loadingScreen() {
   background(black);
   fill(white);
   textFont(PixelFont);
   textSize(60);
   text("Loading Next World...", width/2, height/2);
}
