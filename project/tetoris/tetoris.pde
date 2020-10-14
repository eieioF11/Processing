void setup()
{
  size(1000,900);
  background(255);
  fill(0,0,0);
  rect(0, 0, 500, 900);
}
short x=0,y=0,i,h=850,count=0,r=255,g=0,b=0;
void draw()
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
