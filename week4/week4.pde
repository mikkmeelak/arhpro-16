float x = 0;
float y = 0;

float eelmineX = 0;
float eelmineY = 0;

float time = 0;

void setup() {
  size(720, 720, P3D);
  frameRate(240);
  smooth();
  
  background(30);
  
  x = width / 2;
  y = height / 2;
  
  eelmineX = width / 2;
  eelmineY = height / 2;
}

void draw() {
  time = time + 0.1;
  
  //background(30);
  stroke(255);
  noFill();
  
  // 90 KRAADI SUUND
  //float value = random(0, 1);
  
  //if (value < 0.25) {
  //  x = x + 3;
  //}
  //else if (value < 0.5) {
  //  x = x - 3;
  //}
  //else if (value < 0.75) {
  //  y = y + 3;
  //}
  //else {
  //  y = y - 3;
  //}
  
  // 360 KRAADI SUUND
  float suund = noise(time) * TWO_PI;  
  x = x + (sin(suund) * 3);
  y = y + (cos(suund * PI) * 3);
  
  // 360 KRAADI SUUND. FLOW FIELD
  //float suund = noise(x * 0.01, y * 0.01) * TWO_PI;  
  //x = x + (sin(suund) * 3);
  //y = y + (cos(suund) * 3);
  
  // 360 KRAADI SUUND. time ja -1
  //float suund = noise(x * 0.01, y * 0.01, time) * TWO_PI;  
  //x = x + (sin(suund) * 3);
  //y = y + (cos(suund - 1) * 3);
  
  // EDGE CHECK
  if (x < 0 || x > height) {
    x = width / 2;
    y = height / 2;
  }
  
  if (y < 0 || y > height) {
    x = width / 2;
    y = height / 2;
  }
  
  // EDGE CHECK
  //if (x < 0 || x > height) {
  //  x = random(width);
  //  y = random(height);
  //}
  
  //if (y < 0 || y > height) {
  //  x = random(width);
  //  y = random(height);
  //}
  
  point(x, y);
  
  //line(eelmineX, eelmineY, x, y);
  
  //eelmineX = x;
  //eelmineY = y;
}