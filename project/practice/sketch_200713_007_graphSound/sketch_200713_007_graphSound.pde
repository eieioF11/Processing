import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;

AudioPlayer player; // Minim class
D2Graph tG;

float[] data; //data Array
int width = 600; //window width
int height = 400; 
float r = 0.75; // scale for view window

void setup() {
  size(width, height, P3D);
  background(255);
  tG = new D2Graph(int(width*r), int(height*r), "Time[S]", "Output[dB]");
  minim = new Minim(this); //Minim initialize
  //player = minim.loadFile("drumbeat.mp3", 512); //Audio input from file
  player = minim.loadFile("voice.mp3", 512); //Audio input from file
  data = new float[player.bufferSize()];
}

void draw() {
//make Graph
  int ysp = int((height-height*r)/2);
  for (int i = 0; i < player.bufferSize() - 1; i++) {
    data[i] = map(player.mix.get(i), -1, 1, 0, (height/2+2*ysp));
  }
  tG.graphArrayDraw(data, "P", 1);
}

void mousePressed() {
  player.rewind(); //Sound set to Start
  player.play(); //Sound play
}

void stop() {
  player.close(); minim.stop(); super.stop();
}
