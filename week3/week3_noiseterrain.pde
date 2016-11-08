void setup() {
  size(640, 640, P3D);
  noLoop();
}

void draw() {
  noiseDetail(16, 0.65);

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float noiseValue = noise(x * 0.01, y * 0.01);

      stroke(noiseValue * 255);
      point(x, y);
    }
  }
}

void mousePressed() {
  println("kaader number " + frameCount);

  noiseSeed(frameCount);
  redraw();
}