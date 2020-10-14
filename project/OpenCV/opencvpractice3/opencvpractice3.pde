import gab.opencv.*;  //ライブラリをインポート
import processing.video.*;
import java.awt.*;
 
Capture video;
OpenCV opencv;
PImage canny, scharr, sobel;
 
void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
 
  video.start();  //キャプチャを開始
}
 
void draw() {
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
 
void captureEvent(Capture c) {
  c.read();
}