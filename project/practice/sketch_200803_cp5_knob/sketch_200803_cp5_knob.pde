import controlP5.*;

ControlP5 cp5_K;
Knob knob;

float knobValue;
float knobFuncValue;

void setup(){
  size(600, 350);
  rectMode(CENTER);
  cp5_K = new ControlP5(this);
  
  cp5_K.addKnob("knobValue") // left knob
     .setLabel("left")
     .setRange(0, 100)
     .setValue(50)
     .setPosition(75, 50)
     .setRadius(50);
  
  knob = cp5_K.addKnob("center") // center knob
            .setRange(0, 100)
            .setValue(50)
            .setPosition(250, 50)
            .setRadius(50)
            .setDragDirection(Knob.VERTICAL);
            
  cp5_K.addKnob("knobFunc") // right knob
     .setLabel("right")
     .setRange(0, 100)
     .setValue(50)
     .setPosition(425, 50)
     .setRadius(50)
     .setNumberOfTickMarks(10)
     .setTickMarkLength(5)
     .snapToTickMarks(true);           
}

void knobFunc(float value){
  knobFuncValue = value;
}

void draw(){
  background(128);
  stroke(255);
  noFill();
  rect(125, 250, knobValue, knobValue); // left box
  rect(300, 250, knob.getValue(), knob.getValue()); // center box
  rect(475, 250, knobFuncValue, knobFuncValue); //right box
}
