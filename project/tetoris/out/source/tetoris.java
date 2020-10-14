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

public class tetoris extends PApplet {

public void setup()
{
  
  background(255);
  fill(0,0,0);
  rect(0, 0, 500, 900);
}
short x=0,y=0,i,h=850,count=0,r=255,g=0,b=0;
public void draw()
{
  fill(255);
  fill(0,0,0);
  rect(x+i,0,50,y);//delete
  fill(r,g,b);
  rect(x+i,y,50,50);
  y+=50;
  if(y>h)
  {
    i+=50;
    y=0;
    count++;
  }
  if(x+i>450)
  {
    i=0;
    x=0;
    h-=50;
  }
  if(count>=180)
  {
    fill(0,0,0);
    rect(0, 0, 500, 900);    
  }
}
  public void settings() {  size(1000,900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "tetoris" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
