import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import gab.opencv.*; 
import processing.video.*; 
import java.awt.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class opencvface extends PApplet {





Capture video;
OpenCV opencv;

public void setup() {
  

  //キャプチャは320x240にする
  video = new Capture(this, width/2, height/2);  
  opencv = new OpenCV(this, width/2, height/2);

  //顔用のデータをロード  
  //opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  //目のデータをロード
  opencv.loadCascade(OpenCV.CASCADE_EYE);  
  //口のデータをロード
  //opencv.loadCascade(OpenCV.CASCADE_MOUTH);

  video.start();  //キャプチャを開始
}

public void draw() {
  scale(2);  //画像を2倍に拡大
  opencv.loadImage(video);  //ビデオ画像をメモリに展開
  image(video, 0, 0 );  //表示

  //顔の領域を検出
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  //顔が複数あった場合には、全て検出
  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

public void captureEvent(Capture c) {
  c.read();
}
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "opencvface" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
