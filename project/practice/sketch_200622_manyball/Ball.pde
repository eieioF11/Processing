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

  void display() {
    fill(col[0], col[1], col[2]);
    ellipse(px, py, dia, dia);
  }

  void display(int[] col) {
    fill(col[0], col[1], col[2]);
    ellipse(px, py, dia, dia);
  }
}
