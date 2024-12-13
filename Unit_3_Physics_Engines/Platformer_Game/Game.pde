void Game() {
  if (playerdied == true) {
    playerdied = false;
  }
  if (currentmap == 0) {
    background(brown);
  } else if (currentmap == 1) {
    //background(darkbrown);
    background(skyblue);
  } else if (currentmap == 2) {
    cavebackground.resize(800, 800);
    background(cavebackground);
  }
  manageMaps();
  drawWorld();
  actWorld();
  cheatmodeNotification();
  lives();
}

void gameClicks() {
}

void actWorld() {
  loadPlayerMovement();
  for (int i = 0; i < fancyterrain.size(); i++) {
    FGameObject terrain = fancyterrain.get(i);
    terrain.act();
  }
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject enemy = enemies.get(i);
    enemy.act();
  }
  for (int i = 0; i < enemyvariations.size(); i++) {
    FGameObject1 enemyvar = enemyvariations.get(i);
    enemyvar.act();
  }
}

void drawWorld() {
  pushMatrix();
  if (zoomout == false) {
    if (player1.getX() > 183.78 && player1.getX() < 807.6) {
      if (player1.getY() > 183.78 && player1.getY() < 807.6) {
        translate(-player1.getX()*zoom+width/2, -player1.getY()*zoom+height/2);
      } else if (player1.getY() < 183.78) {
        translate(-player1.getX()*zoom+width/2, -183.78*zoom+height/2);
      } else if (player1.getY() > 807.6) {
        translate(-player1.getX()*zoom+width/2, -807.6*zoom+height/2);
      }
    } else if (player1.getX() < 183.78) {
      if (player1.getY() > 183.78 && player1.getY() < 807.6) {
        translate(-183.78*zoom+width/2, -player1.getY()*zoom+height/2);
      } else if (player1.getY() < 183.78) {
        translate(-183.78*zoom+width/2, -183.78*zoom+height/2);
      } else if (player1.getY() > 807.6) {
        translate(-183.78*zoom+width/2, -807.6*zoom+height/2);
      }
    } else if (player1.getX() > 807.6) {
      if (player1.getY() > 183.78 && player1.getY() < 807.6) {
        translate(-807.6*zoom+width/2, -player1.getY()*zoom+height/2);
      } else if (player1.getY() < 183.78) {
        translate(-807.6*zoom+width/2, -183.78*zoom+height/2);
      } else if (player1.getY() > 807.6) {
        translate(-807.6*zoom+width/2, -807.6*zoom+height/2);
      }
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
          terrainPixels.add(new basicterrainPixel(x, y, c, 0.1, 0));
          FBox pixel = terrainPixels.get(pixelcount);
          world.add(pixel);
          pixelcount++;
        }
        if (c == maroon) {
          terrainPixels.add(new basicterrainPixel(x, y, "teleporterblock.png", 0, 4));
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
    world.setEdges(-20, 0, 982, 1012);

    for (int y = 0; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        color c = img.get(x, y);
        //color cbelow = img.get(x, y+1);
        color leftblock = img.get(x-1, y);
        color rightblock = img.get(x+1, y);
        if (c == brown) {
          //terrainPixels.add(new basicterrainPixel(x, y, "obsidianblocktexture.jpg", 0, 0));
          terrainPixels.add(new basicterrainPixel(x, y, "dirt_center.png", 1, 0));
          FBox pixel = terrainPixels.get(pixelcount);
          world.add(pixel);
          pixelcount++;
        } else if (c == black) {
          terrainPixels.add(new basicterrainPixel(x, y, "stoneblocktexture.jpg", 2.5, 0));
          //terrainPixels.add(new basicterrainPixel(x, y, "blueBlock.png", 1, 0));
          FBox pixel = terrainPixels.get(pixelcount);
          world.add(pixel);
          pixelcount++;
        } else if (c == red) {
          terrainPixels.add(new basicterrainPixel(x, y, skyblue, 0, 1));
          FBox pixel = terrainPixels.get(pixelcount);
          world.add(pixel);
          pixelcount++;
        } else if (c == lightgreen && leftblock == green && rightblock == lightgreen) {
          terrainPixels.add(new basicterrainPixel(x, y, "treetop_w.png", 0, 3));
          //terrainPixels.add(new basicterrainPixel(x, y, "tree_intersect.png", 0, 3));
          FBox treepixel = terrainPixels.get(pixelcount);
          world.add(treepixel);
          pixelcount++;
        } else if (c == lightgreen && leftblock == lightgreen && rightblock == lightgreen) {
          terrainPixels.add(new basicterrainPixel(x, y, "tree_intersect.png", 0, 3));
          FBox treepixel = terrainPixels.get(pixelcount);
          world.add(treepixel);
          pixelcount++;
        } else if (c == lightgreen && leftblock == lightgreen && rightblock == green) {
          terrainPixels.add(new basicterrainPixel(x, y, "treetop_e.png", 0, 3));
          //terrainPixels.add(new basicterrainPixel(x, y, "tree_intersect.png", 0, 3));
          FBox treepixel = terrainPixels.get(pixelcount);
          world.add(treepixel);
          pixelcount++;
        } else if (c == lightgrey) {
          terrainPixels.add(new basicterrainPixel(x, y, "tree_trunk.png", 0, 3));
          FBox treepixel = terrainPixels.get(pixelcount);
          world.add(treepixel);
          pixelcount++;
        } else if (c == orange) {
          terrainPixels.add(new basicterrainPixel(x, y, "jumpboostarrow.png", 0, 1));
          //terrainPixels.add(new basicterrainPixel(x, y, "ladder.png", 0, 1));
          FBox jumpboost = terrainPixels.get(pixelcount);
          world.add(jumpboost);
          pixelcount++;
        } else if (c == yellow) {
          terrainPixels.add(new basicterrainPixel(x, y, "water1.png", 0, 2));
          FBox water = terrainPixels.get(pixelcount);
          world.add(water);
          pixelcount++;
        } else if (c == grey) {
          terrainPixels.add(new basicterrainPixel(x, y, "iceblock.jpg", 0, 0));
          FBox ice = terrainPixels.get(pixelcount);
          world.add(ice);
          pixelcount++;
        } else if (c == pink) {
          FBridge bridge = new FBridge(x, y);
          fancyterrain.add(bridge);
          world.add(bridge);
        } else if (c == blue) {
          FLava lavablock = new FLava(x, y);
          fancyterrain.add(lavablock);
          world.add(lavablock);
        } else if (c == darkpurple) {
          FGoomba gmb = new FGoomba(x, y);
          enemies.add(gmb);
          world.add(gmb);
        } else if (c == darkblue && rightblock == darkblue) {
          FThwomp thwmp = new FThwomp(x+0.5, y);
          enemyvariations.add(thwmp);
          world.add(thwmp);
        } else if (c == lightpurple) {
          FHammerBro hmbro = new FHammerBro(x, y);
          enemies.add(hmbro);
          world.add(hmbro);
        } else if (c == maroon) {
          terrainPixels.add(new basicterrainPixel(x, y, "teleporterblock.png", 0, 4));
          FBox portal = terrainPixels.get(pixelcount);
          world.add(portal);
          pixelcount++;
        }
      }
    }
  }
  if (currentmap == 2) {
    world = new FWorld (-2000, -2000, 2000, 2000);
    world.setGravity(0, 800);
    world.setEdges(-2000, -2000, 2000, 2000);

    for (int y = 0; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        color c = img.get(x, y);
        color bottomblock = img.get(x, y+1);
        color leftblock = img.get(x-1, y);
        color rightblock = img.get(x+1, y);
        color topblock = img.get(x, y-1);
        //color bottomleftblock = img.get(x-1, y+1);
        //color bottomrightblock = img.get(x+1, y+1);
        //color toprightblock = img.get(x+1, y-1);
        //color topleftblock = img.get(x-1, y-1);

        if (c == brown) {
          if ((leftblock == black || leftblock == green) && rightblock == brown && bottomblock == brown && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/leftfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock == brown && (rightblock == black || rightblock == green) && bottomblock == brown && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/rightfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((leftblock == black || leftblock == green) && rightblock == brown && (bottomblock == black || bottomblock == green) && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/bottomleftfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock == brown && (rightblock == black || rightblock == green) && (bottomblock == black || bottomblock == green) && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/bottomrightfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock == brown && rightblock == brown && bottomblock == brown && (topblock == black || topblock == green)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/topfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock == brown && rightblock == brown && (bottomblock == black || leftblock == green) && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/bottomfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((leftblock == black || leftblock == green) && rightblock == brown && bottomblock == brown && (topblock == black || topblock == green)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/topleftfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock == brown && (rightblock == black || rightblock == green) && bottomblock == brown && (topblock == black || topblock == green)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/toprightfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((leftblock == black || leftblock == green) && rightblock == brown && (bottomblock == black || bottomblock == green) && (topblock == black || topblock == green)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/leftpeninsulablock.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock == brown && (rightblock == black || rightblock == green) && (bottomblock == black || bottomblock == green) && (topblock == black || topblock == green)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/rightpeninsulablock.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (rightblock == brown && leftblock == brown && (topblock == black || topblock == green) && (bottomblock == black || bottomblock == green)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/middleblock.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((rightblock == black || rightblock == green) && (leftblock == black || leftblock == green) && topblock == brown && bottomblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/middleblockvertical.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((rightblock == black || rightblock == green) && bottomblock == brown && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/rightfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((leftblock == black || leftblock == green) && bottomblock == brown && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/leftfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (rightblock == brown && leftblock == brown && (topblock == black || topblock == green)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/topfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/centerblock.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          }
        }
        if (c == green) {
            terrainPixels.add(new basicterrainPixel(x, y, "ladderblock.jpeg", 1, 5));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
        } else if (c == maroon) {
           terrainPixels.add(new basicterrainPixel(x, y, "teleporterblock.png", 0, 4));
           FBox portal = terrainPixels.get(pixelcount);
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
    world.remove(portal);
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

void cheatmodeNotification() {
  if (cheatmode == true) {
    fill (grey);
    stroke(black);
    rect(700, 50, 170, 50);
    fill(black);
    textFont(PixelFont);
    textSize(20);
    text("Cheatmode: On", 700, 55);
  }
}

void lives() {
  if (hardcore == false) {
    fill (grey);
    stroke(black);
    rect(100, 50, 170, 50);
    fill(black);
    textFont(PixelFont);
    textSize(30);
    text("HP: " + hp, 100, 60);
  } else if (hardcore == true) {
    fill (grey);
    stroke(black);
    rect(100, 50, 170, 50);
    fill(black);
    textFont(PixelFont);
    textSize(30);
    text("Hardcore", 100, 60);
  }
}
