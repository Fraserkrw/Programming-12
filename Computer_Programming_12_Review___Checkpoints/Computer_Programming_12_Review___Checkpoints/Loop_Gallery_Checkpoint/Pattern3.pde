void pattern3() {
  background (119, 250, 135);
  buttonSetup();
}

void pattern3Clicks() {
   if (dist(leftbuttonX, leftbuttonY, mouseX, mouseY) < 50) {
    mode = Pattern2;

  }
  if (dist(rightbuttonX, rightbuttonY, mouseX, mouseY) < 50) {
    mode = Pattern1;
  }
}
