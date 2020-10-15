float posX = 0.0;   //position X
float posY = 0.0;   //position Y
float dia = 20.0;   // diameter
int inc=0;
int count=0;

void setup() {   // Initialize
  size(200, 200);      //window
  background(0, 0, 0); //black
  noStroke();    //lineless
}

void draw() {    // main loop
  count++;
  fill(0,0,0,inc);
  rect(0,0,width,height);
  if(count>60)
  {
    inc++;
    count=0;
  }
}

void mousePressed()
{
  posX=mouseX;
  posY=mouseY;
  fill(0, 255, 0);  //circle color
  ellipse(posX, posY, dia, dia);  //circle
  inc=0;
}

