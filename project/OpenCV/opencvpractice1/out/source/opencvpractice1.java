import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import gab.opencv.*; 
import processing.video.*; 
import java.awt.*; 
import gab.opencv.*; 
import processing.video.*; 
import java.awt.*; 
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

public class opencvpractice1 extends PApplet {

  //ライブラリをインポート


 
Capture video;
OpenCV opencv;
 
public void setup() {
  
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
 
  video.start();  //キャプチャを開始
}
 
public void draw() {
  opencv.loadImage(video);  //ビデオ画像をメモリに展開
  image(video, 0, 0 );  //表示
}
 
public void captureEvent(Capture c) {
  c.read();
}
  //ライブラリをインポート


 
Capture video;
OpenCV opencv;
 
public void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
 
  video.start();  //キャプチャを開始
}
 
public void draw() {
  opencv.loadImage(video);  //ビデオ画像をメモリに展開
 
  //明るさの調節。-255〜255。
  opencv.brightness(PApplet.parseInt(map(mouseX, 0, width, -255, 255)));
 
  //コントラストの調節。0.0から始まるが
  //100以上になるとほとんど変わらない。
  //opencv.contrast(map(mouseX, 0, width, 0.0, 20.0));
 
  image(opencv.getOutput(), 0, 0 );  //表示   
}
 
public void captureEvent(Capture c) {
  c.read();
}
  //ライブラリをインポート


 
Capture video;
OpenCV opencv;
PImage canny, scharr, sobel;
 
public void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
 
  video.start();  //キャプチャを開始
}
 
public void draw() {
  opencv.loadImage(video);  //ビデオ画像をメモリに展開
 
  //cannyエッジフィルターを使用
  //findCannyEdges(int low, int hgih)
  //high以上のエッジ強度はエッジにする。low以下はエッジにしない
 
  opencv.findCannyEdges(50, 200);
  canny = opencv.getSnapshot();
  image(canny, 0, 0 );  //表示
 
  //Scharrフィルターを使用
  /*
  opencv.findScharrEdges(OpenCV.HORIZONTAL);
  scharr = opencv.getSnapshot();
  image(scharr, 0, 0 );  //表示
  */
 
  //sobelフィルターを使用
  //findSobelEdges(int dx, int dy)は、x, y方向へのずれ。
  //それぞれ0~2の値をとるが、(0, 0)だとエラーになる。
  /*
  opencv.findSobelEdges(1, 0);
  sobel = opencv.getSnapshot();
  image(sobel, 0, 0 );  //表示
  */
}
 
public void captureEvent(Capture c) {
  c.read();
}
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "opencvpractice1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
