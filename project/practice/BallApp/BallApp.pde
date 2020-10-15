import ddf.minim.*;
Minim sound;
AudioPlayer player1;
public static final int top = 1;// 上の壁
public static final int bottom = 2;// 下の壁 
public static final int right = 3;// 右の壁
public static final int left = 4;// 左の壁
public static final int stand = 5;
public static final int fx = 1000;
public static final int fy = 1000;
  
int ballx=10;
int bally=10;
int r = 90;
  
void setup()
{
  size(1000,1000);
  background(255);
  ballx=(int)random(r,1000-r);//initialaize
  println("Ball X:",ballx);
  sound = new Minim(this);
  player1 = sound.loadFile("tin.mp3", 2048);
  field(0);
}
public void field(int fcolor)
{
  int red=0,green=0,blue=0;
  for(int i=0;i<3;i++)
  {
    switch(fcolor&1<<i)
    {
      case 1:red=255;break;
      case 2:green=255;break;
      case 4:blue=255;break;
    }
  }
  fill(red/*red*/,green/*green*/,blue/*blue*/);//0~255
  rect(0, 0,fx,fy);
}
public void ball(int x,int y,int bcolor)
{
  int red=0,green=0,blue=0;
  for(int i=0;i<3;i++)
  {
    switch(bcolor&1<<i)
    {
      case 1:red=255;break;
      case 2:green=255;break;
      case 4:blue=255;break;
    }
  }
  fill(red/*red*/,green/*green*/,blue/*blue*/);//0~255
  ellipse(x,y,r,r);
}
int dx,dy;
int standwidth,standhigh;
public void stand(int standx,int standy,int wi,int hi)
{
  fill(255/*red*/,0/*green*/,0/*blue*/);//0~255
  rect(dx=standx/*x*/,dy=standy/*Y*/,standwidth=wi/*haba*/,standhigh=hi/*takasa*/);
}

public boolean hit(int bx,int by,int mode)
{  
  float bpx = bx-dx;
  float bpy = by-dy;
  float dd = dist(0, 0, bpx, bpy);
  println("dd=",dd);
  switch(mode)
  {
      case 1:
        if(by<(r/2))return true;
        else return false;
      case 2:
        if(by>(fy+r))return true;
        else return false;
      case 3:
        if(bx>(fx-r/2))return true;
        else return false;  
      case 4:
        if(bx<(r/2))return true;
        else return false;
      case 5:
        if(dx<bx&&(dx+standwidth)>bx&&dy<(by+r/2)&&(dy+standhigh)>=(by+r/2))
          return true;
        else
          return false;
      default:return false;
  }
}

 
int Color=0;
void colorchange()
{
  Color+=5;
  if(Color>255)Color=0;
}  
public void screen()
{
  fill(255);
  textSize(50);
  text("score:",50,50,200,100);
  text(nf(score,0),200,50,200,100);
  if((5-rcount)<3)
    fill(255,50,50);
  text(nf(5-rcount,0),fx-150,50,200,100);
  fill(255);
  text("/5",fx-100,50,200,100);
}
public void riset()
{
  bally=score=count=0;
  speed=5;
  rcount++;
}

BOTTON bt1=new BOTTON("BallGame",(fx/2)-100,fy/2,300,100,255,0,0);
  
boolean chy=false,chx=false,ch=true;
int i=0,speed=5;
int count=0,rcount=0;
int score=0;
int memory;

  
public void GAMETASK()
{
    screen();
    ball(ballx,bally,4);
    stand(mouseX-100,800,200,20);
    boolean standhit = hit(ballx,bally,stand);
    boolean topwall = hit(ballx,bally,top);
    boolean bottomwall = hit(ballx,bally,bottom);
    boolean rightwall = hit(ballx,bally,right);
    boolean leftwall = hit(ballx,bally,left);
      
    if(standhit == true)
    { 
      println("Hit!!");  
      colorchange();
      chy=true;
      score++;
      count++;
      ball(ballx,bally,3);
    }
    else if(standhit == false&&chy==false)
      bally+=10;
      
    if(chy==true)
      bally-=speed*2;
    if(chx==true)
      ballx-=speed;
    else if(chx==false)
      ballx+=speed;
      
    if(bottomwall==true)
    {
      memory=memory<score? score:memory;
      riset();
    }
    if(topwall==true)
    {
      chy=false;
      ball(ballx,bally,1);
    }
    if(leftwall==true)
    {
      chx=false;
      ball(ballx,bally,1);
    }
    if(rightwall==true)
    {
      chx=true;
      ball(ballx,bally,1);
    }
}
  
public void Start()
{
  field(0);
  fill(255);
  textSize(50);
  text("Start",(fx/2)-100,fy/2,300,100);
  int COUNT=((100-i+1)/30);
  String str=" "+COUNT+" ";
  text(str,(fx/2)-100,(fy/2)+50,300,100);
  ball((fx/2),(fy/2)-r,COUNT);    
}

public void GameOver()
{
  player1.play();
  if(millis()>20*1000)
     ENDflag=true;
  if(ENDflag)
  {
    player1.play(0);
    player1.pause();
    riset();
    m=false;
    i=0;
    rcount=0;
    ENDflag=false;
  }
  field(0);
  fill(255);
  textSize(50);
  fill(255,50,50);
  text("GameOver",(fx/2)-150,500,300,100);
  fill(255);
  text("Maxscore",(fx/2)-150,600,300,100);
  text(nf(memory,0),(fx/2)-50,700,300,100); 
}  
  
public boolean Menu()
{
  boolean end=false;
  textSize(50);
  text("Menue",(fx/2)-100,50,300,100);
  end=bt1.status();    
  return end;
}
boolean m=false;
boolean ENDflag = false;
void draw()
{
  field(Color);
    
  if(m)
  {
    if(i<100)
    {
      Start();
      i++;
    }
    else if(rcount>=5)
      GameOver();
    else if(count>5)
    {
      //colorchange();
      count=0;
      speed=(int)random(1,100);
      //int add=(int)random(1,100);
      //speed+=add;
    }
    else
      GAMETASK();
  }
  else
    m=Menu();
}  
