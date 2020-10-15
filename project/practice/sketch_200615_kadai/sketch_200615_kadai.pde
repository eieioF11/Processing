float[] mass = {1.0, 1.0} ;     //weight
float[] elast = {1.0, 1.0} ;    //elast
int dia = 20;  //diameter
float[] posX = {10.0, 300.0};   //pos X
float[] posY = {290.0, 290.0};   //pos Y
float[] spdX = {2.3, 0.0};     //speed X
float[] spdY = {-9.99, 0.0} ;     //speed Y
int[][] col = {{255,128,0}, {0, 128, 255}}; //color
int flagK = 0;  //flag by keyboardint
float g=9.8;

void setup() {
  size(400, 300);
  background(0, 0, 0);
  noStroke();
}

void draw(){  
  fill(255,255,255);  //clear color
  rect(0, 0, width, height);   //clear

 if (flagK == 0) {  //watch at flag
    for(int i=0;i<2;i++) {//draw balls
      fill(col[i][0],col[i][1],col[i][2]);    
      ellipse(posX[i], posY[i], dia, dia); 
    }
  } else {
    collisionDetect();
    
    spdY[0] += g/60;

    for(int i=0;i<2;i++) {
      posX[i] += spdX[i];
      posY[i] += spdY[i];
      if (posY[0] >= height-dia/2) 
        posY[0] = height-dia/2;
      if (posY[1] >= height-dia/2)
        posY[1] = height-dia/2;
      fill(col[i][0],col[i][1],col[i][2]);
      ellipse(posX[i], posY[i], dia, dia); 
    }
  }
}

void keyPressed() {
  if (key == ' ') {  //space
    flagK = 1;  //clear mode set
  }
}

void collisionDetect(){
  float bpx = posX[1] - posX[0];
  float bpy = posY[1] - posY[0];
  float dd = dist(0, 0, bpx, bpy); //distance of balls
  
  if( dd <= dia ){
    //Angle along X axis
    float theta = atan2(bpy, bpx); 
    float sint = sin(theta);
    float cost = cos(theta);
    //Direction of ball0
    float tvx0 =   cost*spdX[0] + sint*spdY[0];
    float tvy0 = - sint*spdX[0] + cost*spdY[0];
    //Direction of ball1
    float tvx1 =   cost*spdX[1] + sint*spdY[1];
    float tvy1 = - sint*spdX[1] + cost*spdY[1];
    //Mass & coffeient
    float m0 = mass[0];
    float m1 = mass[1];
    float conf = elast[0]* elast[1];
    
    //Velocity based on conservation of momentum
    float tvx0n = ( ( m0 - conf*m1 ) * tvx0 + m1 * ( 1 + conf ) * tvx1 ) / ( m0 + m1 );
    float tvx1n = ( m0 * ( 1 + conf ) * tvx0 + ( m1 - conf*m0 ) * tvx1 ) / ( m0 + m1 );

    //Velocity each Ball
    spdX[0] = cost*tvx0n - sint*tvy0;
    spdY[0] = sint*tvx0n + cost*tvy0;
    spdX[1] = cost*tvx1n - sint*tvy1;
    spdY[1] = sint*tvx1n + cost*tvy1;
    }
}

