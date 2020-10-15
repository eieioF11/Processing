int numBall = 20;
int dia = 10;  //diameter
float mass = 1.0;     //weight
float elast = 1.0;    //elast

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
    maru[i] = new Ball(pos[i][0], pos[i][1], dia ,mass,elast, spd[i][0], spd[i][1], iro[i]);
  }
}

void draw(){
  fill(0,0,0); //clear color
  rect(0, 0, width, height);
  for (int i = 0; i < numBall; i++) {
    
    if (maru[i].px <= maru[i].dia/2) 
    {
      maru[i].vx*=-1;
      maru[i].px=maru[i].dia/2;
    }    
    if (maru[i].px >= width-maru[i].dia/2) 
    {
      maru[i].vx*=-1;
      maru[i].px=width-maru[i].dia/2;
    }       
    if(maru[i].py <= maru[i].dia/2)
    {
      maru[i].vy*=-1;
      maru[i].py=maru[i].dia/2;
    }
    if(maru[i].py >= height-maru[i].dia/2)
    {
      maru[i].vy*=-1;
      maru[i].py=height-maru[i].dia/2;
    }
    
    for(int j=0;j<numBall;j++)
    {
      if(i!=j)
        collisionDetect(i,j);
    }
    
    maru[i].move();
    maru[i].display();
  }
}

void collisionDetect(int i,int j){
  float bpx = maru[j].px - maru[i].px;
  float bpy = maru[j].py - maru[i].py;
  float dd = dist(0, 0, bpx, bpy); //distance of balls
  
  if( dd <= dia )
  {
    /*
    maru[i].px=maru[i].py=maru[j].px=maru[j].py=100;
    maru[i].vx=maru[i].vy=maru[j].vx=maru[j].vy=0;*/
    println("i,j",i,j);
    //Angle along X axis
    float theta = atan2(bpy, bpx); 
    float sint = sin(theta);
    float cost = cos(theta);
    //Direction of ball0
    float tvx0 =   cost*maru[i].vx + sint*maru[i].vy;
    float tvy0 = - sint*maru[i].vx + cost*maru[i].vy;
    //Direction of ball1
    float tvx1 =   cost*maru[j].vx + sint*maru[j].vy;
    float tvy1 = - sint*maru[j].vx + cost*maru[j].vy;
    //Mass & coffeient
    float m0 = maru[i].mass;
    float m1 = maru[j].mass;
    float conf = maru[i].elast * maru[j].elast;
    
    //Velocity based on conservation of momentum
    float tvx0n = ( ( m0 - conf*m1 ) * tvx0 + m1 * ( 1 + conf ) * tvx1 ) / ( m0 + m1 );
    float tvx1n = ( m0 * ( 1 + conf ) * tvx0 + ( m1 - conf*m0 ) * tvx1 ) / ( m0 + m1 );

    //Velocity each Ball
    maru[i].vx = cost*tvx0n - sint*tvy0;
    maru[i].vy = sint*tvx0n + cost*tvy0;
    maru[j].vx = cost*tvx1n - sint*tvy1;
    maru[j].vy = sint*tvx1n + cost*tvy1;
  }
}
