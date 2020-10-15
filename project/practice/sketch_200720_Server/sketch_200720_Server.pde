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
int flag = 0;

void setup() {
 size(300, 200);
 myServer = new Server(this, port); // Starts a server on port 9999
 sIP = "My IP = " + myServer.ip();
 frameRate(30);
}

void draw() {

  Display(flag);  //drawDisplay
  Client someClient = myServer.available();
  if ( (someClient != null) && (count == 0)) {
    cIP = someClient.ip();           //IP address of client
    cMsg = someClient.readString();  //message from client
    access++;  //access counter
    myServer.write("Hello, " + cMsg +". You are No." + Integer.toString(access) + ". \n");
    flag = 1;  //response mode
  }
  if (flag == 1) {
    count++;
    if (count > 150) {  //wait
      flag = 0;   //wait mode
      count = 0;  //reset
    }
  }
}

void Display(int f) {
  fill(0);
  rect(0,0,width,height);
  
  fill(255);
  textAlign(CENTER);
  textSize(20);
  if (f == 0) {   //wait mode
    text(sIP, 150, 80);
    textSize(15);
    text("Please access me!", 150, 120);
  } else if (f == 1) {   //response mode
    text(cIP + " is accepted", 150, 80);
    textSize(15);
    text("Disconnect after 5 seconds.", 150, 120);
  } else {
    rect(0,0,width,height);
  }
}

void keyPressed() {
  if (key == 'Q' || key == 'q') {  //quit
     myServer.stop();
     exit();
  }
}
