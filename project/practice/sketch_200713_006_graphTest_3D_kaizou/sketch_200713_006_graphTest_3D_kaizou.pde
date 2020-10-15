float data; //data Array 
int count = 0; // Loop count
int width = 600; //window width
int height=400;  //window height
float r = 0.75; // scale for view window
float angle = 0;   //change angle
int zoom = 0;      //change viewport
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
  
  camera( 300+zoom, -50,  300+zoom,   
           0,  0, 0,   
           0,  1, 0); 
  tG.graphDraw(data,angle);
  data = sin(radians(count*6))+cos(radians(count*3));
  count++;
}

void keyPressed() {
  if (key == 'q' || key == 'Q' ) {
  exit();
  }
  if (keyCode == RIGHT) {
    angle += 15;  //30;
  } else if (keyCode == LEFT) {
    angle -= 15;  //30;
  }
  if (keyCode == UP) {
    zoom +=  10;
  } else if (keyCode == DOWN) {
    zoom -= 10;
  }
}
