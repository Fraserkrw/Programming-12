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
        for (int i = 1; i < 8; i++) {
          texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, stoneblock);
        }
      } else if (c == darkgrey) {
        for (int i = 1; i < 8; i++) {
          if (i == 1) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, darkoak);
          }
          if (i == 7) {
            texturedCube(x*gridSize-2000, height-gridSize*i, y*gridSize-2000, gridSize, darkoak);
          }
        }
      } else if (c == orange) {
        texturedCubeAdvanced(x*gridSize-2000, height-gridSize, y*gridSize-2000, gridSize, grasstop, grassbottom, grassside, grassside, grassside, grassside);
        texturedCube(x*gridSize-2000, height-gridSize*4, y*gridSize-2000, gridSize, glowstone);
        //pointLight(252, 218, 142, x*gridSize-4000, height-gridSize*4, y*gridSize-4000);
      }
    }
  }
}
