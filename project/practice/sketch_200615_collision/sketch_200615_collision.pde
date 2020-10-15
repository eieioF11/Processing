int dia = 20;  //diameter
float[] posX = {100.0, 300.0};   //pos X
float[] posY = {150.0, 150.0};   //pos Y
float[] spdX = {2.0, 0.0};     //speed X
float[] spdY = {0.0, 0.0} ;     //speed Y
int[][] col = {{255,128,0}, {0, 128, 255}}; //color
int flagK = 0;  //flag by keyboardint

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

    for(int i=0;i<2;i++) {
      posX[i] += spdX[i];
      posY[i] += spdY[i];
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
 //distance of balls
  float bpx = posX[1] - posX[0];
  float bpy = posY[1] - posY[0];
  float dd = dist(0, 0, bpx, bpy);  

  if( dd <= dia ){
  //Velocity of Ball
    spdX[0] = 0;
  }
}
