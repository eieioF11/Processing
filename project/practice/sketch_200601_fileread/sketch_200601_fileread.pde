// Variance 
int[][] data; //posx, posY, r

//Set window
size(100, 100);
background(0,0,128);

//File open
String[] lines = loadStrings("file.csv");
data = new int[lines.length][3];

//Data read
for( int i=0; i<lines.length; i++ ) {
    data[i] = int(split(lines[i], ','));
}

//Draw circle
noStroke();
for( int i=0; i< lines.length; i++ ) {
  ellipse(data[i][0], data[i][1], data[i][2], data[i][2]);
}

