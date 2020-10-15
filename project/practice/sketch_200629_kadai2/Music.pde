class InstrumentBase
{
  int instrument;
  int channel = 0;
  int pitch = 60;
  int velocity = 127;
  MidiBus myBus; // The MidiBus
  InstrumentBase(int ins)
  {
    instrument=ins;
    myBus = new MidiBus(this, -1, "Microsoft MIDI Mapper");
    MidiBus.list();
    setInstrument(instrument);
  }
  boolean play()
  {
    switch(key)
    {
      case'a':sendNote(60,100);break;
      case's':sendNote(62,100);break;
      case'd':sendNote(64,100);break;
      case'f':sendNote(65,100);break;
      case'g':sendNote(67,100);break;
      case'h':sendNote(69,100);break;
      case'j':sendNote(71,100);break;
      case'k':sendNote(72,100);break;
      case'l':sendNote(74,100);break;
      case'Q':
      case'q':return true;
    }
    return false;
  }
  void sendNote(int note,int d)
  {
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
}

class Piano extends InstrumentBase
{
  Piano()
  {
    super(1);
  }
}
class Organ extends InstrumentBase
{
  Organ()
  {
    super(17);
  }
}
