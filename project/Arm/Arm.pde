import processing.serial.*;
Serial myPort;


float x, y;
float angle1 = 0.0;
float angle2 = 0.0;
float segLength = 100;

int deg1=0;
int deg2=0;
int deg4=0;

int sdeg1=0;
int sdeg2=0;
int sdeg3=0;
int sdeg4=0;



void setup() {
  size(640, 360);
  strokeWeight(30);
  stroke(255, 160);
  
  x = width * 0.3;
  y = height * 0.8;
  myPort = new Serial(this, "COM10", 115200);//home COM4 note COM15
}

void draw() {
  background(0);
  
  angle1 = (mouseX/float(width)-1.0) * PI;
  angle2 = (mouseY/float(height)-0.5) * PI;
  if(angle1>0)
    angle1=0;
  
  pushMatrix();
  segment(x, y, angle1); 
  segment(segLength, 0, angle2);
  popMatrix();
  deg1=(int)degrees(angle1);
  deg2=(int)degrees(angle2);
  sdeg1=(int)map(deg1,-173,0,-15,90);
  sdeg2=(int)map(deg2,-90,90,-4,75);
  if(deg4<=-15)
    deg4=-15;
  if(deg4>=90)
    deg4=90;
  sdeg4=deg4;
  if (mousePressed == true){
    sdeg3=26;
  }
  else
  {
    sdeg3=-40;
  }
}

void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}

void mouseWheel(MouseEvent e ){
  if( e.getAmount() < 0 ){
    //奥に向かって回転させる
    deg4++;
  } else {
    //手前に向かって回転させる
    deg4--;
  }
}

void serialEvent(Serial myPort) { 
   String mystr = myPort.readStringUntil('\n');
   mystr = trim(mystr);
   if(mystr!=null)
   {
     if(mystr.equals("A"))
     {
      myPort.write(180);
      myPort.write(sdeg1);
      myPort.write(sdeg2);
      myPort.write(sdeg3);
      myPort.write(sdeg4);
     }
     else 
     {
       print(mystr+"/");
       println(deg1,deg2,deg4,sdeg1,sdeg2,sdeg3,sdeg4);
     }
   }
}
