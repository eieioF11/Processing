int dia = 20;  //diameter
float posX = 100.0;   //position X
float posY = 30.0;   //position Y
float spd = 5.0;        //speed
int flagK = 0;  //flag by keyboard

void setup() {   // Initialize
  size(200, 400);    //window
  background(0, 0, 0); //black
  noStroke();    //lineless
  frameRate(60);
}

void draw() {    // main loop  
  fill(0,0,0);  //clear color
  rect(0, 0, width, height);
  
  fill(255,128,0);  //circle color
  if (flagK == 0) {  //watch at flag
    ellipse(posX, posY, dia, dia);  //circle
  } else {
    if (posY >= height-dia/2) {
      posY = height-dia/2;
    }
    posY = posY + spd;  //moving
    ellipse(posX, posY, dia, dia);  //circle
  }
}

void keyPressed() {
  if (key == ' ') {  //space
    flagK = 1;  //clear mode set
  }
}

