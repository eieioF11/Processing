void setup() {
  size(300, 200);
  frameRate(15);
}

void draw() {
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textSize(15);
  textAlign(CENTER);  

  //get time
  String jst[] = loadStrings("http://ntp-a1.nict.go.jp/cgi-bin/time");
  String[][] time = new String[3][];
  time[0] = match(jst[0], "(?<= )..(?=:)");
  time[1] = match(jst[0], "(?<=:)..(?=:)");
  time[2] = match(jst[0], "(?<=:)..(?= )");
  
  text("--- Japan Standard Time ---", 150, 60);
  textSize(25);
  text(int(time[0][0])+":"+int(time[1][0])+":"+int(time[2][0]), 150, 100);
  textSize(15);
  text("Push q key for end", 150, 150);
}

void keyPressed() {
  if (key == 'Q' || key == 'q') {  //quit
     exit();
  }
}
