PImage img;
float  scale=1.0;
  
void setup(){
  size( 600, 400 );
 img = loadImage( "../image/cheer1.jpg" );  
  imageMode(CENTER);
  frameRate(30);
}

void draw(){
  scale=scale*1.01;
  if(scale>2)  scale=1.0;
  image(img, width/2, height/2,width*scale,height*scale );    
}
