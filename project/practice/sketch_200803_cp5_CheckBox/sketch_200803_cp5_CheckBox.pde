import controlP5.*;

ControlP5 CP5_C; 
CheckBox CBox;
Button rstButton, clsButton;

String[] CkItems = {"Item 1", "Item 2", "Item 3"};
float[] CkValue = {1,1,1};
int[] num = {0,0,0};

void setup(){
  size(300,300);
  noStroke();
  PFont font = createFont("arial",15);  

  CP5_C = new ControlP5(this);
  //CP5_C.Textlabel.setFont(font);
  CBox = CP5_C.addCheckBox("CheckBox")
             .setPosition(40,20)
             .setItemsPerRow(1)
             .setSpacingColumn(40)
             .setSpacingRow(20);
             
  for(int i=0; i<CkItems.length;i++){
    CBox.addItem(CkItems[i],CkValue[i]);
  }
  
  rstButton = CP5_C.addButton("Reset")
        .setPosition(220,30)
        .setSize(50,15);
        
  clsButton = CP5_C.addButton("Close")
        .setPosition(220,60)
        .setSize(50,15);
}

void draw(){
  background(110); //Color
  fill(255);
  rect(30, 175, 95*num[0], 40*num[0]);
  rect(120, 175, 75*num[1], 40*num[1]);
  rect(190, 175, 75*num[2], 40*num[2]);
  fill(110);
  textSize(15);
  text("Wonderful CP5 User Interface", 45, 200);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(CBox)) {
    for(int i=0; i<CkItems.length;i++){
      num[i]=(int)CBox.getArrayValue()[i];
    }
  }
}

public void Reset() {
  CBox.deactivateAll();
}

public void Close() {
  exit();
}
