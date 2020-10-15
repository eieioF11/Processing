import processing.net.*;

Client myClient;
String sAddress="172.16.30.154";//ここに入力　IP addressは自分のPCのものにすること


int port = 9999;

int flagM = 0;  //flag
String name="Eiji";//ここに入力　　nameは自分の名前にすること
String sMsg=null;


void setup() {
  size(300, 200);
}

void draw() {
  fill(0);
  rect(0,0,width,height);
  
  fill(255);
  textSize(20);
  textAlign(CENTER);
  if (flagM == 0) {
    text("Click me.", 150, 80);
    textSize(15);
    text("Push q key for end", 150, 120);
  } else {
    text("Connected to Server", 150, 80);
    textSize(15);
    text(sMsg, 150, 120);
  } 
} 
void mouseClicked()
{
  myClient = new Client(this,sAddress,port);
  if(myClient.active())
  {
    myClient.write(name);
  }
  else
  {
    println("Conqnection refused.");
    exit();
  }
}

void clientEvent(Client myClient)
{
  if(sMsg != null)
  {
    flagM=1;
    delay(2000);
    flagM=0;
    myClient.stop();
  }
}

void keyPressed()
{
  if(key=='Q'||key=='q')
  {
    myClient.stop();
    exit();
  }
}
