class D3Graph {
    int X_LENGTH, Y_LENGTH;
    float[] y;  //data
    float maxRange;
    int xsp, ysp;  //space x, y

    D3Graph(int _X_LENGTH, int _Y_LENGTH) {
      X_LENGTH   = _X_LENGTH;
      Y_LENGTH   = _Y_LENGTH;
      xsp = int((width-X_LENGTH)/2);
      ysp = int((height-Y_LENGTH)/2);
      y = new float[X_LENGTH];
      for (int i = 0; i < X_LENGTH; i++) {
        y[i] = 0;
      }
    }

    void graphDraw(float _y, float deg) {
      y[X_LENGTH - 1] = _y;
      for (int i = 0; i < X_LENGTH - 1; i++) {
        y[i] = y[i + 1];
      }

      maxRange = 1;
      for (int i=0; i<X_LENGTH-1; i++) {
        maxRange = (abs(y[i]) > maxRange ? abs(y[i]) : maxRange);
      }

      pushMatrix(); {
        rotateY(radians(deg)); 
        translate(-width/2, -height/2, 0);  
        fill(255,0,0);
        stroke(0);
        
        noFill();
        stroke(130);
        strokeWeight(1);
        line(xsp, ysp, xsp, Y_LENGTH+ysp);
        stroke(0,255,0);
        line(xsp, Y_LENGTH/2+ysp, X_LENGTH+xsp, Y_LENGTH/2+ysp);

        fill(60);
        textSize(22);
        textAlign(RIGHT, CENTER);
        text(0, xsp, Y_LENGTH/2+ysp);
        text(nf(maxRange, 0, 1), xsp, ysp);
        text(nf(-1*maxRange, 0, 1), xsp, Y_LENGTH+ysp);

        translate(xsp, Y_LENGTH/2+ysp);
        scale(1, -1);
        strokeWeight(1);
        for (int i=0; i<X_LENGTH-1; i++) {
          stroke(255, 0, 0);
          line(i, y[i]*(Y_LENGTH/2)/maxRange, i+1, y[i+1]*(Y_LENGTH/2)/maxRange);
        }
        
        // floor
        stroke(0); 
        int pitch = 50; 
        for(int i=0; i<=width/2; i += pitch) {  
          line(-pitch, 0, i, X_LENGTH+pitch, 0, i);
          line(-pitch, 0, -i, X_LENGTH+pitch, 0, -i); 
        }
        for(int i=0; i<=X_LENGTH+pitch*2; i += pitch) {  
          line(i-pitch, 0, -width/2, i-pitch, 0, width/2); 
        }
      } popMatrix();
     
   }
}
