import gab.opencv.*;  //ライブラリをインポート
import processing.video.*;
import java.awt.*;
 
Capture video;
OpenCV opencv;
 
void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
 
  video.start();  //キャプチャを開始
}
 
void draw() {
  opencv.loadImage(video);  //ビデオ画像をメモリに展開
 
  //明るさの調節。-255〜255。
  opencv.brightness(int(map(mouseX, 0, width, -255, 255)));
 
  //コントラストの調節。0.0から始まるが
  //100以上になるとほとんど変わらない。
  //opencv.contrast(map(mouseX, 0, width, 0.0, 20.0));
 
  image(opencv.getOutput(), 0, 0 );  //表示   
}
 
void captureEvent(Capture c) {
  c.read();
}