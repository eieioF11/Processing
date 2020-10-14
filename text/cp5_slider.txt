import controlP5.*;

ControlP5 CP5_S;
int sliderValue;

void setup() {
  int myColor = color(255, 0, 0);
  size(320, 240); 
  
  CP5_S = new ControlP5(this);
  
  CP5_S.addSlider("sliderValue")
    .setRange(0, 100)   //from 0 to 100
    .setValue(25)       //initial value
    .setPosition(50, 40)//position
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
    .setPaddingX(-0);                   //padding from right side
}

void draw() {
  background(sliderValue*2);
}
