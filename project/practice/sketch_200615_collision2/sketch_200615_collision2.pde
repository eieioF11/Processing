float[] mass = {1.0, 1.0} ;     //weight
float[] elast = {1.0, 1.0} ;    //elast

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

