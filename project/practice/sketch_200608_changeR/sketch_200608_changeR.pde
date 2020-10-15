int dia = 20;  //diameter
int flagM = 0;  //flag by mouse

void setup() {   // Initialize
  size(200, 200);      //window
  background(0, 0, 0); //black
  noStroke();    //lineless
  textSize(12);  //font size
}

void draw() {    // main loop  
  String title = "Now diameter =";
  
  fill(0, 0, 0);             //text clear
  rect(0, 0, 200, 15);  //text area

  fill(255, 255, 255);  //font color
  text(title+dia, 10, 10);   //draw text 

  if (flagM == 1) {    //watch at mouse flag
     fill(255, 255, 0);  //circle color
     ellipse(mouseX, mouseY, dia, dia);  //circle
     flagM = 0;
   }
}

void mousePressed(){
  flagM = 1; //set
}

void keyPressed() {
  if (keyCode == UP) {  //push UP key
    dia = dia+5;
  } else if(keyCode == DOWN) {  //push DOWN key
    dia = dia-5;
  }
}

