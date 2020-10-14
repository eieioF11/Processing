import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class serial extends PApplet {

// シリアルライブラリを取り入れる


// myPort（任意名）というインスタンスを用意
Serial myPort;

int x,i=1,xd=150; //図形のX座標の変数を用意

public void setup(){
  // 画面サイズ
  
  background(255);
  // シリアルポートの設定
  // "/dev/tty.usbmodem1411" の部分を前述の「シリアルポートを選択する」で選択したシリアルポートにあわせて書き換える
  myPort = new Serial(this, "COM4", 115200);//home COM4 note COM15
}

public void draw(){
  stroke(0);
  strokeWeight(5);
  line(0,250,1850,250);
  stroke(255,0,0);
  strokeWeight(10);
  line(i-2,xd,i,xd=x);
  delay(10);
  i+=2;
  if(i>1850){i=0;background(255);}
}

public void serialEvent(Serial p){
  //変数xにシリアル通信で読み込んだ値を代入
  x = p.read()+250;
  println(x);
}
  public void settings() {  size(1850, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "serial" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
