void drawFloor(int start, int end, int level, int gap) {
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  stroke(255);
  for (int x = start; x <= end; x = x + gap) {
    line (x, level, start, x, level, end);
    line (start, level, x, end, level, x);
  }
}

void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == brown) {
        for (int i = 1; i <= ceilingheight; i++) {
          texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, stoneblock);
        }
      } else if (c == darkgrey) {
        for (int i = 1; i <= ceilingheight; i++) {
          if (i == 1) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, darkoak);
          }
          if (i == 7) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, darkoak);
          }
        }
      } else if (c == green) {
        for (int i = 1; i <= ceilingheight; i++) {
          if (i < ceilingheight-1) {
            texturedCubeAdvanced(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, oakplank, oakplank, bookshelfsides, bookshelfsides, bookshelfsides, bookshelfsides);
          }
          if (i == ceilingheight) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, darkoak);
          }
        }
      } else if (c == skyblue) {
        for (int i = 1; i <= ceilingheight; i++) {
          if (i < 4) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, stoneblock);
          }
          if (i > 4) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, stoneblock);
          }
        }
      } else if (c == red) {
        for (int i = 1; i <= ceilingheight; i++) {
          if (i == 1) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, darkoak);
          }
          if (i > 1 && i < ceilingheight-2) {
            texturedCubeAdvanced(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, barreltop, barreltop, barrelside, barrelside, barrelside, barrelside);
          }
          if (i == ceilingheight) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, darkoak);
          }
        }
      } else if (c == orange) {
        for (int i = 1; i <= ceilingheight; i++) {
          if (i == 1) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, darkoak);
          }
          if (i > 1 && i < ceilingheight-1) {
            texturedCubeAdvanced(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, furnacetop, furnacetop, furnaceside, furnaceside, furnacefront, furnaceside);
          }
          if (i == ceilingheight) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, darkoak);
          }
        }
      }
    }
  }
}
