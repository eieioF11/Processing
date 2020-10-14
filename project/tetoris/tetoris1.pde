int x=0,y=0,i,h=850,count=0,r=255,g=0,b=0,ii,xcount,ycount;
int lh[] = new int[10];
int fnum[][] = new int[10][18];
void setup()
{
  size(500,900);
  background(255);
  fill(0,0,0);
  rect(0, 0, 500, 900);
  for(int c=0;c<10;c++)lh[c]=17;
  //frameRate(100);
}
void draw()
{
  fill(255);
  fill(0);
  rect(0, 0, 500, 900);
  fill(r,g,b);
  rect(x+i,y,50,50);
  for(int c=0;c<10;c++)
  {
    fill(r,g,b);
    rect(x+i,y,50,50);
  }
  y+=10;
  xcount=i/50;
  ycount=y/50;
  if(ycount>=lh[xcount]&&fnum[xcount][ycount]==0)fnum[xcount][ycount]=1;
  if(fnum[xcount][lh[xcount]]==1)lh[xcount]--;
  if(ycount>lh[xcount])
  {
    y=0;
    count++;
  }
  if(x+i>450)
  {
    i=0;
    x=0;
    h-=50;
  }
  println("x"+xcount+"y"+ycount+"fnum"+fnum[xcount][lh[xcount]]);
}
void keyPressed() {
  ii=i;
  if (key == CODED) {    
    if (keyCode == LEFT) i-=50;
    else if (keyCode == RIGHT)i+=50; 
  }
}
