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

byte[][] fielddata = new byte[fx][fy];
void save(int x_,int y_)
{
  int indexX=x_+(int)(fx/2);
  int indexY=y_+(int)(fy/2);
  if()
  fielddata[indexX][indexY]=1;
}
void print()
{
  for(int i=0;i<fx;i++)
  {
    for(int j=0;j<fy;j++)
    {
      if(fielddata[i][j]==1)point(i,j);
    }
  }
}

void draw()
{
  strokeWeight(2);
  stroke(0,0,255);
  //point(x+(int)(fx/2),y+(int)(fy/2));
  x=(int)(dis*cos(radians(angle)));
  y=(int)(dis*sin(radians(angle)))*-1;
  save(x,y);
  print();
  //if(angle>358)field();
  delay(10);
}



void serialEvent(Serial p)
{
  //String myString = p.readStringUntil('\n');
  if (p.available() == 4) 
  {
    byte[] inBuf = new byte[4];
    p.readBytes(inBuf);
    dis=(inBuf[0]<<8)+(inBuf[1]&0xff);
    angle=(inBuf[2]<<8)+(inBuf[3]&0xff);
    print(dis);
    print(",");
    print(angle);
    println(",");
  }
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
