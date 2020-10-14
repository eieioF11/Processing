import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);

  //キャプチャは320x240にする
  video = new Capture(this, width/2, height/2);  
  opencv = new OpenCV(this, width/2, height/2);

  //顔用のデータをロード  
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  //目のデータをロード
  //opencv.loadCascade(OpenCV.CASCADE_EYE);  
  //口のデータをロード
  //opencv.loadCascade(OpenCV.CASCADE_MOUTH);

  video.start();  //キャプチャを開始
}

void draw() {
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

void captureEvent(Capture c) {
  c.read();
}
