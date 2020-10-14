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

public class practice1 extends PApplet {

public void setup(){
  
  background(255);
}

float x = 300;
float y = 200;
int r = 180;
short checkx = 0,checky = 0;
public void draw(){
  fill(100);
  rect(0, 0,1000, 800);
  fill(0/*red*/,x/*green*/,y/*blue*/);//0~255
  ellipse(x, y, r, r);
  if(x<90)
  {
    x++;
    checkx = 0;
  }
  else if(x>910)
  {
    x--;
    checkx = 1;
  }
  else if(y<90)
  {
    y++;
    checky = 0;
  }
  else if(y > 710)
  {
    y--;
    checky = 1;
  }
  else if(checkx == 0)
  {
    x++;
    if(checky == 0)
    {
      y++;
    }
  }
  else if(checkx == 1)
  {
    x--;
    if(checky == 1)
    {
      y--;
    }
  }
}
  public void settings() {  size(1000, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "practice1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
