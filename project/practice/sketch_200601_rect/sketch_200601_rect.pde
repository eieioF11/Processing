// Variance
int w = 240;
int h = 240;

// Set window
size(w, h);
background(0,0,128);

// basis
float bW = w/6;
float bH = h/6;

// Draw rectangle
rect(bW,      bH,bW,bH);
rect(bW*2,bH,bW,bH);
rect(bW*3,bH,bW,bH);
rect(bW*4,bH,bW,bH);
rect(bW,  bH*2,bW,bH);
rect(bW*2,bH*2,bW,bH);
rect(bW*3,bH*2,bW,bH);
rect(bW*4,bH*2,bW,bH);

rect(bW,  bH*3,bW,bH);
rect(bW*2,bH*3,bW,bH);
rect(bW*3,bH*3,bW,bH);
rect(bW*4,bH*3,bW,bH);

rect(bW,  bH*4,bW,bH);
rect(bW*2,bH*4,bW,bH);
rect(bW*3,bH*4,bW,bH);
rect(bW*4,bH*4,bW,bH);

