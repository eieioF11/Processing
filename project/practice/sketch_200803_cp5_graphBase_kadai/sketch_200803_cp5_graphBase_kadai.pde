import controlP5.*;

ControlP5 CP5_S;
Knob knob;
int sliderValue;
int sflag=0,wflag=0;

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
  
  CP5_S = new ControlP5(this);
  CP5_S.addSlider("sliderValue")
    .setRange(0, 100)   //from 0 to 100
    .setValue(25)       //initial value
    .setPosition(70,250)//position
    .setSize(200, 20)   //size
//    .setColorActive(myColor)//hover
//    .setColorBackground(myColor) //background color
//    .setColorCaptionLabel(myColor) //color of caption
//    .setColorForeground(myColor) //slider color
//    .setColorValueLabel(myColor) //color of value text
    .setSliderMode(Slider.FIX)//shape:Slider.FLEXIBLE is reversed triangle

    .setNumberOfTickMarks(11);

  //Position of present value
  CP5_S.getController("sliderValue")
    .getValueLabel()
    .align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE) //right side
    .setPaddingX(-0); 
  knob = CP5_S.addKnob("center") // center knob
            .setRange(0, 100)
            .setValue(50)
            .setPosition(500, 220)
            .setRadius(50)
            .setDragDirection(Knob.VERTICAL);
            
  CP5_S.addButton("STOP")
     .setValue(64)
     .setPosition(70,290)
     .setSize(100,20);
     
  CP5_S.addButton("Wave2")
     .setValue(64)
     .setPosition(180,290)
     .setSize(100,20);
}

void draw(){
  //noLoop();
  background(255);
  Axis();
  Labels();
  geneData(count);
  redraw();
  textSize(10);
  text("down < Speed > up",150,285);
  text("Amplitude",550,210);
  if(sflag==1)
    count++;
  if(count > 360) {
    count = 0;
  }
  println(sliderValue,knob.getValue());
  delay((100-sliderValue));
}

void controlEvent(ControlEvent theEvent){
 if(theEvent.getController().getName() == "STOP")
 {
   if(sflag==0)
     sflag=1;
   else 
     sflag=0;
 }
 if(theEvent.getController().getName() == "Wave2")
 {
   if(wflag==0)
     wflag=1;
   else 
     wflag=0;
 }
}
// Generate data
void geneData(int cn) {
  data = new float[rowN]; // data statement
  for(int i=0; i<rowN; i++) {
    int sita = i+cn;    
    if(wflag==0)
    {
      data[i]=tan(radians(sita))*(knob.getValue()/100);
      /*
      data[i] = 9.26/3;
      for(int n=0;n<20;n++)
        data[i] = 4*pow(-1,n)*(4/pow(n,2))*cos(n*radians(sita))*(knob.getValue()/10);        
        
      data[i] = 4/3.14;
      for(int n=0;n<20;n++)
        data[i] = 4/3.14*(sin((2*n-1)*radians(sita))/(2*n-1))*(knob.getValue()/10);*/
    }
    else
      data[i] = sin(radians(sita))*(knob.getValue()/100);
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
