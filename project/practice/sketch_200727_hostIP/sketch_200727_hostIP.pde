import java.util.*;
import java.net.InetAddress;
 
//String address = "weather.livedoor.com";
//String address = "www.youtube.com";//www.yahoo.co.jp
String address = "www.yahoo.co.jp";
int timeOut = 5000;
boolean connected;
InetAddress inet;
String ipNo;

void setup() {
  size(300, 200);
  background(0);
  try {
    inet = InetAddress.getByName(address);
    println(inet);
    connected = inet.isReachable(timeOut);
    print("inet.isReachable = ");
    println(connected);
    
    if(connected == true) {
      ipNo = inet.getHostAddress(); 
      println(ipNo);
    }
  }
  catch (Exception e) {
    println("Exception");
    e.printStackTrace();
  }
}
 
void draw()
{
  fill(255);
  textSize(20);
  textAlign(CENTER);
  if(connected == true) {
     text(address, 150, 80);
     text(ipNo, 150, 100);
     textSize(15);
     text("Push q key for end", 150, 150);
  } else {
     text("We can not find.", 150, 80);
     text(address, 150, 100);
     textSize(15);
     text("Push q key for end", 150, 150);
  }
  noLoop();
}

void keyPressed() {
  if (key == 'Q' || key == 'q') {  //quit
     exit();
  }
}
