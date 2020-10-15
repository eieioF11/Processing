PImage img;

void setup() {
  img = loadImage("../../image/paprikaL.jpg");
  size(img.width, img.height);
}

void draw() {
  background(0);
  image(img, 0, 0);
  noStroke();
  fill(0);
  rect(20, 20, 60, 20);

// draw color-box 
  color c = get(mouseX, mouseY);
  fill(red(c), 0, 0);
  rect(20, 20, 20, 20);
  fill(0, green(c), 0);
  rect(40, 20, 20, 20);
  fill(0, 0, blue(c));
  rect(60, 20, 20, 20);

// write RGB-pixel value
  String s1= String.valueOf(int(red(c)));
  textSize(8);
  text(s1,20,20);
  String s2= String.valueOf(int(green(c)));
  text(s2,40,20);
  String s3= String.valueOf(int(blue(c)));
  text(s3,60,20);

// draw cross-line 
  stroke(255, 102);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
}
