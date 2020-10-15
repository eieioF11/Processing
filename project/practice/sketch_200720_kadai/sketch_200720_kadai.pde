//Server Programing(Lecture)

import processing.net.*;

Server myServer;
Client someClient;
int port = 9999;

String sIP = null;
String cMsg = null;
String cIP = null;
int access = 0;  //counter
int count = 0;  //counter
byte[] byteBuffer = new byte[2];

void setup() {
 size(400, 400);
 myServer = new Server(this, port); // Starts a server on port 9999
 sIP = "My IP = " + myServer.ip();
 frameRate(30);
 fill(0);
}

void draw() {
  int x=0,y=0;
  Client someClient = myServer.available();
  if ( (someClient != null) && (count == 0)) {
    cIP = someClient.ip();           //IP address of client
    int byteCount = someClient.readBytes(byteBuffer); 
    x=byteBuffer[0];
    y=byteBuffer[1];
    access++;  //access counter
    println(x,y);
    //myServer.write("Hello, " + cMsg +". You are No." + Integer.toString(access) + ". \n");
  }
  
  Display(x,y);  //drawDisplay
  textAlign(CENTER);
  textSize(15);
  //text(sMsg, 150, 120);
}



void Display(int x,int y) {
  /*fill(0);
  rect(0,0,width,height);
  fill(255);*/
  ellipse(200-x, 200-y, 10, 10); 
}

void keyPressed() {
  if (key == 'Q' || key == 'q') {  //quit
     myServer.stop();
     exit();
  }
}
