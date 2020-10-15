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
int i,j;
for(i=1;i<=4;i++)
{
  for(j=1;j<=4;j++)
  {
    rect(i*bW,j*bH,bW,bH);
  }
}

