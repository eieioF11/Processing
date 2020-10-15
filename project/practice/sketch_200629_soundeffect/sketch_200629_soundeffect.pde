import ddf.minim.*;
Minim sound;
AudioSample tin;
Ball maru;

int[] iro = {128, 255, 255};
int flagK = 0; //flag by keyboard

void setup() { // Initialize
  size(200, 200); //window
  background(0, 0, 0); //black
  noStroke(); //lineless
  maru = new Ball(100,10,0,1,20); //insta
  maru.display(iro);
  sound = new Minim(this);
  tin = sound.loadSample("tin.mp3", 512);
}

void draw() { // main loop
  if (flagK == 1) { //watch at flag
    clear();
    maru.display(iro);
  }
  if(maru.py >= (height-maru.dia/2)) {
    flagK = 0;
    clear();
    maru.py = 10;
    maru.display(iro);
    tin.trigger();
  }
}

void keyPressed() {
  if (key == ' ') { //space
    flagK = 1; //clear mode set
  }
}

void clear() {
  fill(0,0,0); //clear color
  rect(0, 0, width, height);
}

void stop() {
  tin.close();
  sound.stop();
  super.stop();
}
