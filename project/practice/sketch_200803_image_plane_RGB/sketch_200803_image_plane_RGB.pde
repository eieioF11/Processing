PImage img,imgR,imgG,imgB;

void setup() {
  img = loadImage("../../image/paprika.jpg");
  imgR = loadImage("../../image/paprika.jpg");
  imgG = loadImage("../../image/paprika.jpg");
  imgB = loadImage("../../image/paprika.jpg");
  size(img.width*2, img.height*2);
  image(img, 0, 0);
  noLoop();
  }

void draw() {
  color c;
  img.loadPixels();
  imgR.loadPixels();
  imgG.loadPixels();
  imgB.loadPixels();
  int n = img.width * img.height;
// pixel value copy 
  for ( int i = 0; i < n; i++) {
    c = img.pixels[i];
    imgR.pixels[i]=color(red(c), 0, 0);
    imgG.pixels[i]=color(0, green(c), 0);
    imgB.pixels[i]=color( 0, 0, blue(c));
    /*Gray*/
    /*
    imgR.pixels[i]=color(red(c), red(c), red(c));
    imgG.pixels[i]=color(green(c), green(c), green(c));
    imgB.pixels[i]=color( blue(c), blue(c), blue(c));
    */
  }
// R-plane 
  image(imgR, img.width, 0);
  textSize(30);
  text("RED",img.width+2,img.height-2);
// G-plane
  image(imgG, 0, img.height);
  textSize(30);
  text("GREEN",0,img.height*2-2);
// B-plane
  image(imgB, img.width, img.height);
  textSize(30);
  text("BLUE",img.width+2,img.height*2-2);
}
