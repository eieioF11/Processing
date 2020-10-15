//20200622 the 4th p.4

Ball maru0, maru1;   //Object
int[] iro = {0, 255, 255};

void setup() {
  size(200, 200);      //window
  background(0, 0, 0); //black
  noStroke();    //lineless
  maru0 = new Ball(100,50,20);   //instance
  maru1 = new Ball(120,100,30, iro);   //instance
}

void draw(){ 
  fill(255, 0, 255);  //circle color
  ellipse(maru0.px, maru0.py, maru0.dia, maru0.dia);
  fill(maru1.col[0], maru1.col[1], maru1.col[2]);  
  ellipse(maru1.px, maru1.py, maru1.dia, maru1.dia);  
}

//******** class *******
class Ball{
  float px, py;    //position
  float vx, vy;    //velocity
  float dia;       //diameter
  int[] col = {};
 
  Ball(float x, float y, float d) {
     px = x; py = y; dia = d;
  }
 
  Ball(float x, float y, float d, int[] c) {
     px = x; py = y; dia = d;
     col = c;
  }
}

