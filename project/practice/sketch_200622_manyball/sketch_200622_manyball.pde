//20200622 the 4th p.8

int numBall=50;
Ball[] maru=new Ball[numBall]; //Object
int[][] iro = new int[numBall][3];

void setup() {
  size(200, 200); //window
  background(0, 0, 0); //black
  noStroke(); //lineless
  for(int i=0;i<numBall;i++){
    for(int j=0;j<3;j++){
      iro[i][j]=(int)(random(1)*255);
    }
    maru[i]=new Ball(100*random(-1,1)+100,100*random(-1,1)+100,10,iro[i]);
  }
}

void draw(){
  for(int i=0;i<numBall;i++){
    maru[i].display();
  }
}
