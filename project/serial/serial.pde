import processing.serial.*;
Serial myPort;

int x=0,y=0;
int data1,data2;

void field()
{
  strokeWeight(2);
  stroke(0,0,0);
  line(0,500,1000,500);
  strokeWeight(2);
  stroke(0,0,0);
  line(500,0,500,1000);
}
void setup(){
  size(1000,1000);
  background(255);
  field();
  myPort = new Serial(this, "COM8", 115200);//home COM4 note COM15
}

void draw()
{
  strokeWeight(8);
  stroke(0,0,255);
  point(x+500,y+500);
  delay(10);
}

void serialEvent(Serial p){
  String myString = p.readStringUntil('\n');
  myString = trim(myString);
  //int sensors[] = int(split(myString, ','));
  //if (sensors.length > 1) {
    //fillColor = map(sensors[0], 0, 1023, 0, 255);
    //diameter = map(sensors[1], 0, 1023, 0, height);
  //}
  println(myString);
}
