class Ball{
  float px, py;    //position
  float vx, vy;    //velocity
  float dia;       //diameter
 
  Ball(float x, float y, float d) {
     px = x; py = y; dia = d;
  }
  Ball(float x, float y, float sx, float sy, float d) {
     px = x; py = y; vx = sx; vy = sy; dia = d;
  }
  
  void display(int[] col) {
     fill(col[0],  col[1],  col[2]);
     px += vx; py += vy;
     ellipse(px, py, dia, dia);
  }
}

