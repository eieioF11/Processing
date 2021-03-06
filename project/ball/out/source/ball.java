import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ball extends PApplet {

public static final int top = 1;// 上の壁
public static final int bottom = 2;// 下の壁 
public static final int right = 3;// 右の壁
public static final int left = 4;// 左の壁
public static final int stand = 5;
public static final int fx = 1000;
public static final int fy = 1000;

int ballx=10,bally=10,r = 90;
public void setup()
{
  
  background(255);
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
public void screen(int num)
{
  switch(num)
  {
    case 0:
      field(0);
      fill(255);
      textSize(50);
      text(nf(5-(i/20),0),(fx/2)-50,fy/2,300,100);
      break;
    case 1:
      fill(255);
      textSize(50);
      text("Start",(fx/2)-100,fy/2,300,100);
      break;
    case 2:
      fill(255);
      textSize(50);
      text("score:",50,50,200,100);
      text(nf(score,0),200,50,200,100);
      if((5-rcount)<3)fill(255,50,50);
      text(nf(5-rcount,0),fx-150,50,200,100);
      fill(255);
      text("/5",fx-100,50,200,100);
      break;
    case 3:
      field(0);
      fill(255);
      textSize(50);
      fill(255,50,50);
      text("GameOver",(fx/2)-150,500,300,100);
      fill(255);
      text("Maxscore",(fx/2)-150,600,300,100);
      text(nf(memory,0),(fx/2)-50,700,300,100);
      break;
  }
}
public void riset()
{
  bally=score=count=0;
  speed=10;
  rcount++;
}
boolean chy=false,chx=false,ch=true;
int i=0,speed=10;
int count=0,rcount=0;
int score=0;
int memory;
public void draw()
{
  field(0);
  if(i<100)
  {
    screen(0);
    i++;
  }
  else if(i>99&&i<130)
  {
    screen(1);
    i++;
  }
  else if(rcount>=5)
  {
    screen(3);
  }
  else if(count>5)
  {
    count=0;
    speed*=2;
  }
  else
  {
    screen(2);
    ball(ballx,bally,4);
    stand(mouseX-100,800,200,20);
    boolean standhit = hit(ballx,bally,stand);
    boolean topwall = hit(ballx,bally,top);
    boolean bottomwall = hit(ballx,bally,bottom);
    boolean rightwall = hit(ballx,bally,right);
    boolean leftwall = hit(ballx,bally,left);
    if(standhit == true)
    {
      chy=true;
      score++;
      count++;
      ball(ballx,bally,3);
    }
    else if(standhit == false&&chy==false)
      bally+=10;
    if(chy==true)bally-=speed*2;
    if(chx==true)ballx-=speed;
    else if(chx==false)ballx+=speed;
    if(bottomwall==true)
    {
      memory=memory<score? score:memory;
      riset();
    }
    if(topwall==true){chy=false;ball(ballx,bally,1);}
    if(leftwall==true){chx=false;ball(ballx,bally,1);}
    if(rightwall==true){chx=true;ball(ballx,bally,1);}
  }
}
  public void settings() {  size(1000,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ball" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
