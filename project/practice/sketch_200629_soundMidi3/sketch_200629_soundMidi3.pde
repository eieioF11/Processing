import themidibus.*; //Import the library
MidiBus myBus; // The MidiBus
int flagK = 0;  //flag by keyboard
int instrument = 0;

void setup() {
  size(400,200);
  background(0);
  MidiBus.list();
  myBus = new MidiBus(this, -1, "Microsoft MIDI Mapper");
  setInstrument(instrument);
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
  setInstrument(instrument);
  int note = floor(random(0, 127)); 
  sendNote(note,500);
  if(instrument>128)instrument=1;
  else instrument++;
}

void keyPressed() {
  if (key == 'Q' || key == 'q') {  //quit
    flagK = 1;  //flag set
  }
}

void sendNote(int note,int d)
{
  int channel = 0;
  int pitch = 60;
  int velocity = 127;
  myBus.sendNoteOn(channel, note, velocity);  // Send a Midi noteOn
  delay(d);
  myBus.sendNoteOff(channel, note, velocity); // Send a Midi nodeOff
  delay(d);
}

void setInstrument(int value)
{
  byte data[] = new byte[2];
  data[0] = (byte)0xC0;
  data[1] = (byte)value;
  myBus.sendMessage(data);
}
