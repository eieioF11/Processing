PImage photo;
int  count=0,i=0,j;
int[][] data,data2; //posx, posY
int  data_length;
int  number=0,x,y,x1,x2,y1,y2;
float  dx,dy;
void setup(){
  size( 600, 400 );
  photo = loadImage( "../../image/meguro_river.jpg" );
//  photo = loadImage( "cherry_blossom.jpg" );  //cherry blossom
//  photo = loadImage( "cheer1.jpg" );  //cheer
  imageMode(CORNER);
  frameRate(60);
  
//File open
  String[] lines=loadStrings("../../data/position2.csv");  //from file
  data = new int[lines.length][2];
  data_length=lines.length;
  data2 = new int[4000*lines.length][2];

//Data read
  for( int i=0; i<lines.length; i++ ) {
    data[i] = int(split(lines[i], ','));
  }
  for( int i=0; i<lines.length; i++ ) {
    println("i="+i +" data[i][0]="+data[i][0]+" data[i][1]="+data[i][1]);
  }
  for( int i=1; i<lines.length; i++ ) {
    x1=data[i-1][0];y1=data[i-1][1];
    x2=data[i][0];y2=data[i][1];
    dx=x2-x1;dy=y2-y1;
    if(abs(dx)>=abs(dy)){
      if(dx>0){
        for(j=0;j<dx;j++){
          data2[number+j][0]=x1+j;
          data2[number+j][1]=y1+int(j*dy/dx);
        }
      }else{  
         for(j=0;j<abs(dx);j++){
          data2[number+j][0]=x1-j;
          data2[number+j][1]=y1+int(-j*dy/dx);
        }
      }
    }else{
      if(dy>0){
        for(j=0;j<dy;j++){
          data2[number+j][1]=y1+j;
          data2[number+j][0]=x1+int(j*dx/dy);
        }
      }else{
        for(j=0;j<abs(dy);j++){
          data2[number+j][1]=y1-j;
          data2[number+j][0]=x1+int(-j*dx/dy);     
        }
      }
    } 
    number += j; 
    println("i="+i +" data[i][0]="+data[i][0]+" data[i][1]="+data[i][1]+" j="+j +" number="+number);
  }
  data2[number][0]=x2;
  data2[number][1]=y2;
  i=0;
}

void draw(){
  int  x, y;
  i++;
  if(i<number){
    x=data2[i][0];y=data2[i][1];
    image( photo,-x+width/2,-y+height/2 );
  }
}
