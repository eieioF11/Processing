public static final int top = 1;// 上の壁
public static final int bottom = 2;// 下の壁 
public static final int right = 3;// 右の壁
public static final int left = 4;// 左の壁
public static final int stand = 5;
public static final int fx = 1000;
public static final int fy = 1960;
int ballx=10,bally=10,r = 90;
void setup()
{
  size(1000,1960);
  background(255);
}
void ball(int x,int y)
{
  fill(0/*red*/,0/*green*/,255/*blue*/);//0~255
  ellipse(x,y,r,r);
}
int dx,dy;
int standwidth,standhigh;
void stand(int standx,int standy,int wi,int hi)
{
  fill(255/*red*/,0/*green*/,0/*blue*/);//0~255
  rect(dx=standx/*x*/,dy=standy/*Y*/,standwidth=wi/*haba*/,standhigh=hi/*takasa*/);
}
boolean hit(int bx,int by,int mode)
{
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
boolean chy=false,chx=false;
void draw()
{
  fill(50);
  rect(0, 0,fx,fy);
  ball(ballx,bally);
  stand(mouseX-100,1600,200,20);
  boolean standhit = hit(ballx,bally,stand);
  boolean topwall = hit(ballx,bally,top);
  boolean bottomwall = hit(ballx,bally,bottom);
  boolean rightwall = hit(ballx,bally,right);
  boolean leftwall = hit(ballx,bally,left);
  if(standhit == true)
    chy=true;
  else if(standhit == false&&chy==false)
    bally+=10;
  if(chy==true)bally-=10;
  if(chx==true)ballx-=10;
  else if(chx==false)ballx+=10;
  if(bottomwall==true)bally=0;
  if(topwall==true)chy=false;
  if(leftwall==true)chx=false;
  if(rightwall==true)chx=true;
}
  