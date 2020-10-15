// Variance 
int[][] data; //posx, posY, r

//Set window
size(200, 100);
background(255,255,255);

//File open
String[] lines = loadStrings("GorinMark.csv");
data = new int[lines.length][6];

//Data read
for( int i=0; i<lines.length; i++ ) {
    data[i] = int(split(lines[i], ','));
}

//Draw circle
noStroke();
noFill();
for( int i=0; i< lines.length; i++ ) {
  strokeWeight(5);
  stroke(data[i][3],data[i][4],data[i][5]);
  ellipse(data[i][0], data[i][1], data[i][2], data[i][2]);
}
