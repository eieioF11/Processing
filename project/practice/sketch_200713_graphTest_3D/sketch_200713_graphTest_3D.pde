float data; //data Array 
int count = 0; // Loop count
int width = 600; //window width
int height=400;  //window height
float r = 0.75; // scale for view window
D3Graph tG; //3Dgraph Class

void setup() {
  size(width, height, P3D);
  frameRate(60);
//background(255);
  smooth();
  tG = new D3Graph(int(width*r), int(height*r));
}

void draw() {
  background(255);
  
  camera( 300, -50,  300,   
           0,  0, 0,   
           0,  1, 0); 
  tG.graphDraw(data,0);
  data = sin(radians(count*6))+cos(radians(count*3));
  count++;
}

void keyPressed() {
  if (key == 'q' || key == 'Q' ) {
  exit();
  }
}
