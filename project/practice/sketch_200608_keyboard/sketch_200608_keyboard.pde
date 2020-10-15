int dia = 20;  //diameter
int inc = 0;   // increment
int flagM = 0;  //flag by mouse
int flagK = 0;  //flag by keyboard

void setup() {   // Initialize
  size(200, 200);      //window
  background(0, 0, 0); //black
  noStroke();    //lineless
}

void draw() {    // main loop  
  if (flagM == 1) {  //watch at mouse flag
     fill(255, 0, 0);  //circle color
     ellipse(mouseX, mouseY, dia, dia);  //circle
     flagM = 0;
   }
   
   if( flagK == 1 ) {  //watch at keyboard flag
     fill(0, 0, 0, inc);      //clear color
     rect(0, 0, width, height);//clear
     inc++;  // increment
      
     if( inc > 60 ) {
       flagK = 0;  //reset
       inc = 0;   //reset
     }
  }
}

void mousePressed(){
  flagM = 1; //set
}

void keyPressed() {
  if (key == 'q' || key == 'Q') {
    flagK = 1;  //clear mode set
  }
}
