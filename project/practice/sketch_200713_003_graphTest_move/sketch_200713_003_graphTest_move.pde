float data; //data Array 
int count = 0; // Loop count
int width = 600; //window width
int height=400;  //window height

float r = 0.75; // scale for view window
D2Graph tG; //2Dgraph Class

void setup() {
  size(width, height, P3D);
  frameRate(60);
  background(255);
  smooth();
  tG = new D2Graph(int(width*r), int(height*r), "Time[S]", "Output[V]");
}

void draw() {
//noLoop();
//data = new float[int(width*r)];
//for (int i=0; i<int(width*r); i++) {
//data[i] = sin(radians(i*6));
//}
//tG.graphStaticDraw(data);
  tG.graphPointDraw(data);
  data = sin(radians(count*6))+cos(radians(count*3));
//data = sin(radians(count*6));
  count++;
}

void keyPressed() {
  if (key == 'q' || key == 'Q' ) {
  exit();
  }
}
