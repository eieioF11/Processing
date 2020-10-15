import controlP5.*;

ControlP5 cp5_B;

int myColor = color(255);
int c1,c2;
float n,n1;

void setup() {
  size(400,300);
  noStroke();
  cp5_B = new ControlP5(this);
  cp5_B.setColorBackground( color( 64 ) );
     
  cp5_B.addButton("color_A")
     .setValue(64)
     .setPosition(150,70)
     .setSize(100,20);
  
  cp5_B.addButton("color_B")
     .setValue(128)
     .setPosition(150,100)
     .setSize(100,20);
     
  cp5_B.addButton("color_C")
     .setValue(192)
     .setPosition(150,130)
     .setSize(100,20);

  cp5_B.addButton("Reset")
     .setPosition(150,200)
     .setSize(100,20);

  cp5_B.addButton("Close")
     .setPosition(150,230)
     .setSize(100,20);
     
}

void draw() {
  background(myColor);
  myColor = lerpColor(c1,c2,n); //2 color brending
  n += (1-n)* 0.1; 
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  n = 0;
}

public void color_A(int theValue) {
  c1 = c2;
  c2 = color(0,160,100);
}

public void color_B(int theValue) {
  c1 = c2;
  c2 = color(150,0,0);
}

public void color_C(int theValue) {
  c1 = c2;
  c2 = color(255,255,0);
}

public void Reset() {
  c1 = c2;
  c2 = color(0,0,0);
}

public void Close() {
  exit();
}
