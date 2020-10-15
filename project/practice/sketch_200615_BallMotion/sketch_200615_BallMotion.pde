int dia = 20;  //diameter
float posX = 10.0;   //position X
float posY = 10.0;   //position Y
float spdX = 0.5;        //speed
float spdY = 0.0;        //speed
float GRAV = 9.8;
int flagK = 0;  //flag by keyboard
float REAC = 0.8;//reaction
float FRIC = 0.995;//friction

void setup() {   // Initialize
  size(200, 400);    //window
  background(0, 0, 0); //black
  noStroke();    //lineless
  frameRate(60);
}

void draw() {    // main loop  
  fill(0,0,0,10);  //clear color
  rect(0, 0, width, height);
  
  fill(0,128,255);  //circle color
  if (flagK == 0) {  //watch at flag
    ellipse(posX, posY, dia, dia);  //circle
  } else {
    spdY += GRAV/60;
    posX += spdX;
    posY += spdY;
    if (posY >= height-dia/2) {
      //spdY *=-REAC;//reaction
      spdY *=-1;
      posY = height-dia/2;
    }
    //spdX *=FRIC;//friction
    //spdY *=FRIC;//friction
    ellipse(posX, posY, dia, dia);  //circle
  }
}

void keyPressed() {
  if (key == ' ') {  //space
    flagK = 1;  //clear mode set
  }
}

