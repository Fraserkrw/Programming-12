void pattern3() {
  background (0);
  pattern3Draw();
  pattern3Draw2();
  pattern3Draw3();
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

void pattern3Draw() {
 strokeWeight(3);
 int i = 0;
 float waveAmplitude = 150;
 while (i < numslines) {
   yoff = cos(counter + i * 0.1) * waveAmplitude;
   stroke (pattern3r[i], pattern3g[i], pattern3b[i]);
   line (lineX[i], lineY[i]+yoff, lineX[i], lineY[i]-yoff);
   i++;
 }
 counter = counter + 0.01;
 if (counter > 360) {
 counter = 0;
 }
}

void pattern3Draw2() {
 strokeWeight(3);
 int i = 0;
 float waveAmplitude2 = 250;
 while (i < numslines) {
   yoff2 = cos(counter2 + i * 0.1) * waveAmplitude2;
   stroke (pattern3r[i], pattern3g[i], pattern3b[i], 70);
   line (lineX[i], lineY[i]+yoff2, lineX[i], lineY[i]-yoff2);
   i++;
 }
 counter2 = counter2 + 0.01;
 if (counter2 > 360) {
 counter2 = 0;
 }
}

void pattern3Draw3() {
 strokeWeight(3);
 int i = 0;
 float waveAmplitude3 = 350;
 while (i < numslines) {
   yoff3 = cos(counter3 + i * 0.1) * waveAmplitude3;
   stroke (pattern3r[i], pattern3g[i], pattern3b[i], 30);
   line (lineX[i], lineY[i]+yoff3, lineX[i], lineY[i]-yoff3);
   i++;
 }
 counter3 = counter3 + 0.01;
 if (counter3 > 360) {
 counter3 = 0;
 }
}
