float time = 0;

void setup() {
  size(720, 720, P3D);
  smooth(8);
}

void draw() {
  background(30);
  stroke(255);
  noFill();

  time = time + 0.001;
  
  float axisX = map(mouseX, 0, width, 0, 1);
  float axisY = map(mouseY, 0, height, 0, 2);
    
  noiseDetail(16, axisY);
    
  for (int i = 0; i < height; i = i + 5) {
    beginShape();
    
    for (int x = 0; x < width; x = x + 10) {
      float val = noise(i * 0.01, x * 0.001, time);   
      
      curveVertex(x, val * height);
    }
    
    endShape();
  }
  
  
}