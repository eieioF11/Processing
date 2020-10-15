PImage photo;
int  count=0,i=0,j,flag=0;
int[][] data,data2; //posx, posY
int  data_length;
int  number=0,x,y,x1,x2,y1,y2;
float  dx,dy;
void setup(){
  size( 600, 400 );
  photo = loadImage( "../../image/meguro_river.jpg" );
  imageMode(CORNER);
  frameRate(60);
}

void draw(){
  int  x, y;
  i++;
  if(flag==1)
    line(mouseX,mouseY,pmouseX,pmouseY);
  if(i<number){
    x=data2[i][0];y=data2[i][1];
    image( photo,-x+width/2,-y+height/2 );
  }
}
void mouseClicked(){
  if(mouseButton == LEFT){
    background(255,255,255);
    flag=1;i=0;
  }else{
    image( photo, 0,0,width,height );    //zentai
    i=0;
  }
}
