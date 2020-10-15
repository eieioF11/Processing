class Ball{
  float px, py; //position
  float vx, vy; //velocity
  float dia; //diameter
  int[] col = {};

  Ball(float x, float y, float d) {
    px = x; py = y; dia = d;
  }

  Ball(float x, float y, float d, int[] c) {
    px = x; py = y; dia = d;
    col = c;
  }

  Ball(float x, float y,float d,float sx, float sy, int[] c) {
    px = x; py = y; dia = d;
    vx=sx;
    vy=sy;
    col = c;
  }
  
  void move(){
    px += vx;
    py += vy;
  }
  
  void display() {
    fill(col[0], col[1], col[2]);
    ellipse(px, py, dia, dia);
  }

  void display(int[] col) {
    fill(col[0], col[1], col[2]);
    ellipse(px, py, dia, dia);
  }
}
