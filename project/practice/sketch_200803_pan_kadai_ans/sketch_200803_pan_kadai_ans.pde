import java.awt.Toolkit;
PImage photo;
PrintWriter output;
int  LIMIT=400,flag=0,i=0,number;
int[][] data=new int[LIMIT][2]; //posx, posY
float  step;
void setup(){
  size(600,400);
  photo = loadImage( "../../image/meguro_river.jpg" );
  imageMode(CORNER);
  background(255,255,255);
  image( photo, 0,0,width,height );    //zentai
  step=float(photo.width)/width;
}
void draw(){
  int  x,y;
  if(mousePressed){
    stroke(255,255,255);
    line(mouseX,mouseY,pmouseX,pmouseY);
    if((mouseX != pmouseX) || (mouseY != pmouseY)){
      data[i][0]=mouseX;data[i][1]=mouseY;
      if(++i > LIMIT){
        println("Buffer Over!! Buffer Size=4000");
        background(255,255,255);
      }
    }
  }
  if(flag==1){
    x=int(step*data[i][0]);y=int(step*data[i][1]);
    if((x>width/2)&&(x<photo.width-width/2)&&
       (y>height/2)&&(y<photo.height-height/2))
      image( photo, width/2-x,height/2-y );
    if(++i >= number)
      flag=0;
    delay(100);  
  }
}
void mouseClicked(){
  if(mouseButton == LEFT){
    background(255,255,255);
    number=i-1;
    output = createWriter("output.txt");
    for(i=0;i<number;i++){
      output.println(int(step*data[i][0])+","+int(step*data[i][1]));
//      println(data[i][0]+","+data[i][1]);
      output.flush();
    }
    output.close();
    flag=1;i=0;
  }else{
    image( photo, 0,0,width,height );    //zentai
    i=0;
  }
}
