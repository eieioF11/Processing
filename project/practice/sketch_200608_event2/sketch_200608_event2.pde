float posX = 0.0;   //position X
float posY = 0.0;   //position Y
float dia = 20.0;   // diameter
int count;  //counter 

void setup() {   // Initialize
  size(200, 200);      //window
  background(0, 0, 0); //black
  noStroke();    //lineless
}

void draw() {    // main loop
  if (mousePressed==true) {  //1s
    posX=mouseX;
    posY=mouseY;
    fill(0, 255, 0);  //circle color
    ellipse(posX, posY, dia, dia);  //circle
    count = 0;  //reset
  }
}

