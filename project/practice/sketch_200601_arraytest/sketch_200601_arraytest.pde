// Statement
int[] x = new int[5];
int[] y = new int[5];
int[] r = new int[5];

//data input
x[0]=30; x[1]=70; x[2]=20; x[3]=80; x[4]=60;
y[0]=30; y[1]=20; y[2]=70; y[3]=80; y[4]=50;
r[0]=40; r[1]=20; r[2]=10; r[3]=30; r[4]=10;

// Set window
size(100, 100);
background(0, 0, 128);

//Draw circle
noStroke();
for( int i=0; i<5; i++ ) {
  ellipse(x[i], y[i], r[i], r[i]);
}
