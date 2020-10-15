//20200622 the 4th p.4

Ball maru0, maru1;   //Object
int[][] iro = {{0, 0, 255},{0, 255, 0}};

void setup() {
  size(200, 200);      //window
  background(0, 0, 0); //black
  noStroke();    //lineless
  maru0 = new Ball(100,50,20);   //instance
  maru1 = new Ball(120,100,30, iro[1]);   //instance
}

void draw(){ 
  maru0.display(iro[0]);
  maru1.display();
}

//******** class *******
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

