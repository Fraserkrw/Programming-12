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
  mapselectorbutton();
  showmap();
  //println("X: "+mouseX+" Y: "+mouseY+" ");
}

void gameClicks() {
  //Map Button
  if (mouseX > 675 && mouseX < 775 && mouseY > 25 && mouseY < 125) {
    showmap = !showmap;
  }

  //Level Buttons
  if (mouseX > 200 && mouseX < 300 && mouseY > 260 && mouseY < 360) {
    currentmap = 0;
    basicmapreset();
    showmap = false;
  }
  if (mouseX > 350 && mouseX < 450 && mouseY > 260 && mouseY < 360) {
    if (levelsunlocked >= 1) {
    currentmap = 1;
    basicmapreset();
    showmap = false;
    }
  }
  if (mouseX > 500 && mouseX < 600 && mouseY > 260 && mouseY < 360) {
    if (levelsunlocked >= 2) {
    currentmap = 2;
    basicmapreset();
    showmap = false;
    }
  }
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
          if ((leftblock != brown) && rightblock == brown && bottomblock == brown && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/leftfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock == brown && (rightblock != brown) && bottomblock == brown && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/rightfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((leftblock != brown) && rightblock == brown && (bottomblock != brown) && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/bottomleftfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock == brown && (rightblock != brown) && (bottomblock != brown) && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/bottomrightfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock == brown && rightblock == brown && bottomblock == brown && (topblock != brown)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/topfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock == brown && rightblock == brown && (bottomblock != brown) && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/bottomfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((leftblock != brown) && rightblock != black && bottomblock == brown && (topblock != brown)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/topleftfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock != black && (rightblock != brown) && bottomblock == brown && (topblock != brown)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/toprightfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((leftblock != brown) && rightblock != black && (bottomblock != brown) && (topblock != brown)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/leftpeninsulablock.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (leftblock != black && (rightblock != brown) && (bottomblock != brown) && (topblock != brown)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/rightpeninsulablock.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (rightblock == brown && leftblock == brown && (topblock != brown) && (bottomblock != brown)) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/middleblock.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((rightblock != brown) && (leftblock != brown) && topblock == brown && bottomblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/middleblockvertical.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((rightblock != brown) && bottomblock == brown && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/rightfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if ((leftblock != brown) && bottomblock == brown && topblock == brown) {
            terrainPixels.add(new basicterrainPixel(x, y, "darkgrassblocktextures/leftfacing.jpeg", 1, 0));
            FBox pixel = terrainPixels.get(pixelcount);
            world.add(pixel);
            pixelcount++;
          } else if (rightblock == brown && leftblock == brown && (topblock != brown)) {
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
        } else if (c == red) {
          terrainPixels.add(new basicterrainPixel(x, y, skyblue, 0, 1));
          FBox pixel = terrainPixels.get(pixelcount);
          world.add(pixel);
          pixelcount++;
        } else if (c == darkblue) {
          terrainPixels.add(new basicterrainPixel(x, y, "water1.png", 1, 2));
          FBox water = terrainPixels.get(pixelcount);
          world.add(water);
          pixelcount++;
        } else if (c == grey) {
          FLava lavablock = new FLava(x, y);
          fancyterrain.add(lavablock);
          world.add(lavablock);
        } else if (c == darkpurple) {
          FGoomba gmb = new FGoomba(x, y);
          enemies.add(gmb);
          world.add(gmb);
        } else if (c == yellow) {
          FBoo boo = new FBoo(x, y);
          enemies.add(boo);
          world.add(boo);
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
    hp = 100;
    terrainPixels.clear();
    enemies.clear();
    fancyterrain.clear();
    world.remove(portal);
    currentmap++;
    if (currentmap > levelsunlocked) {
    levelsunlocked++;
    }
    loadWorld(maps[currentmap]);
    world.add(player1);
    mapchange = false;
  }
}

void basicmapreset() {
  if (currentmap == 0) {
    player1.setPosition(50, 50);
  } else if (currentmap == 1) {
    player1.setPosition(100, 150);
  } else if (currentmap == 2) {
    player1.setPosition(50, 150);
  }
  player1.setVelocity(0, 0);
  pixelcount = 0;
  hp = 100;
  terrainPixels.clear();
  enemies.clear();
  fancyterrain.clear();
  world.remove(portal);
  loadWorld(maps[currentmap]);
  world.add(player1);
  //if (currentmap == 0) {
  //  player1.setPosition(100, 100);
  //} else if (currentmap == 1) {
  //  player1.setPosition(100, 150);
  //} else if (currentmap == 2) {
  //  player1.setPosition(100, 150);
  //}
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
    rect(100, 110, 170, 50);
    fill(black);
    textFont(PixelFont);
    textSize(20);
    text("Cheatmode: On", 100, 115);
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

void mapselectorbutton() {
  //Button
  fill (grey);
  stroke(black);
  RectTactileStroke(725, 75, 100, 100);
  rect(725, 75, 100, 100);
  image(mapicon, 690, 40, 75, 75);
}

void showmap() {
  if (showmap == true) {
    //Screen
    fill (grey);
    stroke(black);
    rect(width/2, height/2, 500, 500);

    //Levels Text
    textSize(40);
    fill(black);
    text("LEVELS", width/2, 210);

    //Level Buttons
    if (currentmap == 0) { //Intro Level
      fill (yellow);
    } else {
      fill (#393434);
    }
    stroke(black);
    RectTactileStroke(250, 310, 100, 100);
    rect(250, 310, 100, 100);
    fill(black);
    textSize(20);
    text("INTRO", 250, 315);

    if (currentmap == 1) { //Level 1
      fill (yellow);
    } else {
      fill (#393434);
    }
    stroke(black);
    if (levelsunlocked >= 1) {
      RectTactileStroke(400, 310, 100, 100);
    }
    rect(400, 310, 100, 100);
    if (levelsunlocked >= 1) {
      fill(black);
      textSize(20);
      text("1", 400, 315);
    } else {
      image(lockicon, 375, 280, 50, 60);
    }

    if (currentmap == 2) { //Level 1
      fill (yellow);
    } else {
      fill (#393434);
    }
    stroke(black);
    if (levelsunlocked >= 2) {
      RectTactileStroke(550, 310, 100, 100);
    }
    rect(550, 310, 100, 100);
    if (levelsunlocked >= 2) {
      fill(black);
      textSize(20);
      text("2", 550, 315);
    } else {
      image(lockicon, 525, 280, 50, 60);
    }
  }
}
