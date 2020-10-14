import processing.serial.*;
Serial myPort;

public static final int fx = 1000;
public static final int fy = 1000;

int x=0,y=0;
int dis=0,angle;
//float angle=0;

void field()
{
  background(0);//255
  strokeWeight(2);
  stroke(255,255,255);
  line(0,(int)(fy/2),fx,(int)(fy/2));
  strokeWeight(2);
  stroke(255,255,255);
  line((int)(fx/2),0,(int)(fx/2),fy);
}
void setup()
{
  size(1000,1000);
  field();
  myPort = new Serial(this, "COM8", 115200);//home COM4 note COM15
  //myPort = new Serial(this, "COM8", 230400);//home COM4 note COM15
}

void draw()
{
  strokeWeight(2);
  stroke(0,0,255);
  point(x+(int)(fx/2),y+(int)(fy/2));
  x=(int)(dis*cos(radians(angle)));
  y=(int)(dis*sin(radians(angle)))*-1;
  //if(angle>358)field();
  delay(10);
}



void serialEvent(Serial p)
{
  //String myString = p.readStringUntil('\n');
  byte[] inBuf = new byte[4];
  p.readBytes(inBuf);
  //dis=inBuf[0]+inBuf[1]<<8;
  angle=inBuf[3]+inBuf[4]<<8;
  //int data = p.read();
  //dis=data&0xffff;
  //angle=data>>15;
  print(dis);
  print(",");
  print(angle);
  println(",");
  //println(data);
  /*
  if(myString!=null)
  {
    myString = trim(myString);
    String data[] = split(myString, ',');
    if (data.length > 1) 
    {
      //println(data[0]);
      //println(data[1]);
      dis=Integer.parseInt(data[0]);
      angle=Float.parseFloat(data[1]);
      dis/=2;
      //println(dis);
      //println(angle);
    }
    print("(");
    print(x);
    print(",");
    print(y);
    print(")/");
    println(myString);
  }
  //println(myString);*/
}
