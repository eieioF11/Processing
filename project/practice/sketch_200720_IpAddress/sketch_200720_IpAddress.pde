//Find your IP Address
import processing.net.*;
Server myServer;
int  port=9999;  //port No.
int flagM = 0;  //flag by mouse
String IPmsg = null;

void setup() {
  size(300, 200);
  myServer = new Server(this,port);  //Starts a server
  IPmsg = "Your IP=" + myServer.ip();
}

void draw() {
  fill(0);
  rect(0,0,width,height); 
  fill(255);
  textSize(20);
  textAlign(CENTER);
  if(flagM == 0) {
     text("--- Find your IP ---", 150, 80);
     textSize(15);
     text("Please click me", 150, 120);
  } else {
     text(IPmsg, 150, 80);
     textSize(15);
     text("Push q key for end", 150, 120);
  }
}

void mousePressed(){
  flagM = 1;
}

