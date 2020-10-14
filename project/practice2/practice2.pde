public static final int top = 1;// ???
public static final int bottom = 2;// ??? 
public static final int right = 3;// ???
public static final int left = 4;// ???
public static final int red = 5;
public static final int green = 6;
public static final int blue = 7; 
int fx=1000,fy=1000;
int ballx=10,bally=10,r = 90;
void setup()
{
  size(1000,1000);
  background(255);
}
void ball(int x,int y,int ballcolor)
{
  switch(ballcolor)
  {
    case 5:fill(255/*red*/,0/*green*/,0/*blue*/);break;
    case 6:fill(0/*red*/,255/*green*/,0/*blue*/);break;
    default:
    case 7:fill(0/*red*/,0/*green*/,255/*blue*/);break;
  }
  ellipse(x,y,r,r);
}
int dx,dy;
boolean hitball(int bx,int by,int wi,int hi)
{
  fill(0/*red*/,255/*green*/,0/*blue*/);//0~255
  rect(dx/*x*/,dy/*Y*/,wi/*haba*/,hi/*takasa*/);
  if(dx<bx&&(dx+wi)>bx&&dy<(by+r/2)&&(dy+hi)>=(by+r/2))
    return true;
  else
    return false;
}
boolean hitwall(int bx,int by,int mode)
{
  switch(mode)
  {
    case 1:
      if(by<(r/2))return true;
      else return false;
    case 2:
      if(by>(fy-r/2))return true;
      else return false;
    case 3:
      if(bx>(fx-r/2))return true;
      else return false;  
    case 4:
      if(bx<(r/2))return true;
      else return false;
    default:return false;
  }
}
boolean chy=false,chx=false;
void draw()
{
  dx=mouseX-100;dy=800;
  fill(50);
  rect(0, 0,fx,fy);
  ball(ballx,bally,blue);
  boolean hit = hitball(ballx,bally,200,20);
  boolean topwall = hitwall(ballx,bally,top);
  boolean rightwall = hitwall(ballx,bally,right);
  boolean leftwall = hitwall(ballx,bally,left);
  if(hit == true)
  {
    ball(ballx,bally,red);
    chy=true;
  }
  else if(hit == false&&chy==false)
    bally += 10;
  if(chy==true)
    bally -= 10;
  if(chx==true)
    ballx -= 10;
  else if(chx==false)
    ballx += 10;
  if(bally>(fy+r))bally=0;
  if(topwall==true)
  {
    ball(ballx,bally,red);
    chy=false;
  }
  if(leftwall==true)
  {
    ball(ballx,bally,red);
    chx=false;
  }
  if(rightwall==true)
  {
    ball(ballx,bally,red);
    chx=true;
  }
}
  