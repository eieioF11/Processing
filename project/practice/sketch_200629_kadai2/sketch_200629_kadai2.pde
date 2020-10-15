import themidibus.*; //Import the library
MidiBus myBus; // The MidiBus
InstrumentBase ins;
int flagK = 0;  //flag by keyboard
int instrument = 0;

void setup() {
  size(400,200);
  background(0);
  ins = new Organ();
  //ins = new Piano();
  frameRate(60);
}

void draw() {

  
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("--- Play Music ---", 200, 80);
  textSize(12);
  String s = "Instrument No. = " + Integer.toString(instrument);
  text(s, 200, 100);
  text("Quit, press 'q' key", 200, 130);
  if (flagK == 1) {
    exit();
  }

}

void keyPressed() 
{
  if(ins.play())
    flagK = 1;
}


