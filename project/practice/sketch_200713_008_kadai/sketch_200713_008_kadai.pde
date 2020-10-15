import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

BandPass bpf;
Minim minim;
FFT fft; //FFT class
AudioPlayer player; // Minim class
D2Graph tG;

float[] data; //data Array
int width = 600; //window width
int height = 400; 
float r = 0.75; // scale for view window

void setup() {
  size(width, height, P3D);
  background(255);
  
  bpf =new BandPass(800,20,44100);
  
  tG = new D2Graph(int(width*r), int(height*r), "Frequncy[Hz]", "Output[dB]");

  minim = new Minim(this); //Minim initialize
  //player = minim.loadFile("sin.wav", 512); //Audio input from file
  player = minim.loadFile("sinT.wav", 512); //Audio input from file
  //player = minim.loadFile("sin1000.wav", 512); //Audio input from file
  //player = minim.loadFile("sin2000.wav", 512); //Audio input from file
  player.addEffect(bpf);
  fft = new FFT(player.bufferSize(), player.sampleRate());   //FFT initialize
  fft.window(FFT.HAMMING);    //FFT window setting
  data = new float[fft.specSize()];
}

void draw() {
  fft.forward(player.mix); //FFT Analyz
  
  //make Graph
  for (int i = 0; i < fft.specSize(); i++) {
    data[i] = fft.getBand(i);
  }
  tG.graphArrayDraw(data, "L", 5);
}

void mousePressed() {
  player.rewind(); //Sound set to Start
  player.play(); //Sound play
}
void stop() {
  player.close(); minim.stop(); super.stop();
}

