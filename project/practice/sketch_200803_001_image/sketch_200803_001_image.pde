PImage img;

void setup() {
    img = loadImage( "../../image/landscape.jpg" );
//    img = loadImage( "../../image/dora.gif" );
    size( 800,600 );  //fixed size window 
//    size( img.width, img.height );  //image size window
}
void draw() {
  image( img, 0, 0 );
  //image( img, 0, 0, 100, 100 );
}
