import java.awt.Toolkit;

Ball maru;

int[] iro = {128, 255, 255};
int flagK = 0;  //flag by keyboard

void setup() {   // Initialize
  size(200, 200);    //window
  background(0, 0, 0); //black
  noStroke();    //lineless
  maru = new Ball(100,10,0,2,20);   //instance
  maru.display(iro);
}

void draw() {    // main loop  
  if (flagK == 1) {  //watch at flag
    clear();
    maru.display(iro);
  }
  if(maru.py >= (height-maru.dia/2)) {
    flagK = 0;
    clear();
    maru.py = 10;
    maru.display(iro);
  }  
}

void keyPressed() {
  if (key == ' ') {  //space
    flagK = 1;  //clear mode set
    Toolkit.getDefaultToolkit().beep();   
    delay(100);
  }
}

void clear() {
    fill(0,0,0);  //clear color
    rect(0, 0, width, height);
}

