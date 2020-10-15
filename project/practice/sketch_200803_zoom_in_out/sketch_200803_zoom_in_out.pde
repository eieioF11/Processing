PImage img;
float  scale=1.0;
  
void setup(){
  size( 600, 400 );
 img = loadImage( "../../image/cheer1.jpg" );  
  imageMode(CENTER);
  frameRate(30);
}

int f=0;

void draw(){
  if(f==0)
    scale=scale/1.01;
  else
    scale=scale*1.01;
  if(scale<1){scale=2;f=1;}
  else if(scale>1){scale=1;f=0;}
  delay(1000);
  
  image(img, width/2, height/2,width*scale,height*scale );    
}
