import javax.mail.*;
import javax.mail.internet.*;

String hostIP="172.16.30.146";
String mailAddress="test001@acpTMCIT.com";
String mailSource="T4_28@acpTMCIT.com";
String sender="Eiji";
String mailSubject="TEST";
String mailMessage="Hellow World!!";

int flagSend=0;
int flagK=0;
int count=0;

void setup()
{
  size(600,200);
  fill(0);
  frameRate(10);
}

void draw() {
  fill(0);
  rect(0,0,width,height);
  
  fill(255);
  textAlign(CENTER);
  textSize(15);
  
  if(flagK == 1) {
    text("Sending to : "+mailAddress, 300, 40);
    text("My address : "+mailSource, 300, 60);
    text("Sending from : "+sender, 300, 80);
    text("Title : "+mailSubject, 300, 110);
    text("Msg : "+mailMessage, 300, 130);
    text("If you OK->y, NO->n ", 300, 170);
  } else if(flagK == 2) {
    count++;
    if(count == 1) {
      sendMail();
    }
    text("Now status is sending the mail.", 300, 100);
    if( flagSend == 1 ) {
      text("Sucess mail send.", 300, 160);
    } else {  
      text("Sending to "+mailAddress, 300, 140);
    }
    if(count > 30) {
       flagK = 0;
       count = 0;
       flagSend = 0;
    }
  } else {
    text("(1)key->SendMail", 300, 100);
    text("(2)key->CheckMail", 300, 120);
    text("If you hit q or Q, Finish.", 300, 170);
    textSize(20);
    text("Mail Control Program", 300, 60);
  }
}

void keyPressed() {
  if (key == '1') {            //Send
     flagK = 1;   
  } else if  (key == '2') {    //Check
     textSize(15);
     text("Sorry, not impemented.", 300, 140);
  } else if (key == 'y' || key == 'Y') {  //Send
     flagK = 2;
  } else if (key == 'n' || key == 'N') {  //Back
     flagK = 3;
  } else if (key == 'Q' || key == 'q') {  //quit
     exit();
  }
}

