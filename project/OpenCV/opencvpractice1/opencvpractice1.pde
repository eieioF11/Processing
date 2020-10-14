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
  image(video, 0, 0 );  //表示
}
 
void captureEvent(Capture c) {
  c.read();
}
