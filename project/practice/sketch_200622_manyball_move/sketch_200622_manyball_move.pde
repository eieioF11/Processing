int numBall = 20;
Ball[] maru = new Ball[numBall];
int[][] iro = new int[numBall][3];
float[][] spd = new float[numBall][3];
float[][] pos = new float[numBall][3];

void setup() {
  size(200, 200); //window
  background(0, 0, 0); //black
  noStroke(); //lineless
  for (int i = 0; i < numBall; i++) {
    for (int j=0; j<3; j++ ) {
      iro[i][j] = (int)(random(1)*255);
      spd[i][j] = random(-1,1);
      pos[i][j] = 90*random(-1,1)+100;
    }
    maru[i] = new Ball(pos[i][0], pos[i][1], 10, spd[i][0], spd[i][1], iro[i]);
  }
}

void draw(){
  fill(0,0,0); //clear color
  rect(0, 0, width, height);
  for (int i = 0; i < numBall; i++) {
    maru[i].move();
    maru[i].display();
  }
}
