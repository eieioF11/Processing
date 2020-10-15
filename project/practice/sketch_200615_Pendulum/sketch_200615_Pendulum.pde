//Pendulum

float posX, posY;             //position
float R = 220;          //radius
float rad = -0.5*PI;  //start angle
float angle_vel = 0.0;        // angular velocity
float GRAV = 0.3;    //gravity
float angle_accel;        //angular acceleration
float damp = 0.998;     //damping rate
 
void setup() {
  size(500, 270);
  background(255,255,255);
}
 
void draw() {
  fill(255,255,255);  //clear color
  rect(0, 0, width, height);

  // angular acceleration = (-1*G/radius)*sin(angle)
  angle_accel = (-1*GRAV/R)*sin(rad);  // angular acceleration
 
  angle_vel += angle_accel;  // angular velocity
  angle_vel *= damp;         // damping rate
  rad += angle_vel;          //result
 
  posX = R*cos(rad + 0.5*PI);
  posY = R*sin(rad + 0.5*PI);
 
  stroke(0,0,0);
  line(width/2, 0, posX + width/2, posY);   //線
  noStroke();
  fill(0,0,0);
  ellipse(posX + width/2, posY, 30, 30);      //円
}
