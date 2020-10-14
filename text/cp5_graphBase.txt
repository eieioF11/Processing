int width = 600, height = 320;

int UM = 40; //Up Margin
int DM = 80; //Down Margin
int LM = 80; //Left Margin
int RM = 40; //Right Margin

int numSubV = 10; // number of sub Y scale
int numSubH = 20; // number of sub X scale
String xLabel = "Time (S)";
String yLabel = "Output (V)";

int rowN = width-(LM+RM);   // number of data row and col
float scale = 4.0; //standard
PFont font;
float[] data;  //read data array
int count = 0;

// main loop
void setup(){
  size(width, height);
  font = createFont("Arial",12);
  textFont(font);
  frameRate(60);
  background(255);
   
  Axis();
  Labels();

}

void draw(){
  //noLoop();
  background(255);
  Axis();
  Labels();
  geneData(count);
  redraw();

  count++;
  if(count > 360) {
    count = 0;
  }
}

// Generate data
void geneData(int cn) {
  data = new float[rowN]; // data statement
  for(int i=0; i<rowN; i++) {
    int sita = i+cn;
    data[i] = sin(radians(sita));
  }
}

// redraw the graph
void redraw() {
  stroke(0,0,255);
  float baseLine = (height-(UM+DM))/2 + UM;
  float basePitch = (height-DM-UM)/numSubV;

  for(int t=0; t<rowN; t++) {
    int posX = LM+t;
    int posY = int(baseLine-data[t]*basePitch*scale);
    point(posX, posY);
  }
  stroke(0);
}

// Display any variables
void Axis(){
  strokeWeight(1);  //line width
  stroke(0);      //line color
  fill(255);
  rect(LM, UM, width-(LM+RM), height-(UM+DM));
  
  stroke(90);      //line color
  for(float y=0;y<=numSubV;y++){ //Number Of Vertical Sub Divisions
     int barY=(height-DM)-int((height-DM-UM)*(y/numSubV));
     line(LM-5, barY, LM+5, barY);
     if(y == numSubV/2) {
       line(LM, barY, width-RM, barY);
     }
  }
  for(float x=0;x<=numSubH;x++){ //Number Of Horizontal Sub Divisions
     int barX = LM + int((width-DM-UM)*(x/numSubH));
     line(barX, (height-UM-DM)/2+UM-5, barX, (height-UM-DM)/2+UM+5);
  }
}

void Labels(){
  textFont(font,12);
  fill(0);
  textAlign(CENTER, BOTTOM);
  rotate(radians(-90));
  text(yLabel,-((height-DM-UM)/2+UM),LM*3/4);
 
  rotate(radians(90));
  text(xLabel,LM+((width-LM-RM)/2),height-DM*2/3);
}
