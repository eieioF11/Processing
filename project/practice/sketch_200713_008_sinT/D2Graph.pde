// class D2Graph ---------------------------------------------
// Member:
//  int X_LENGTH, Y_LENGTH;
//  String X_LABEL, Y_LABEL;
//  float[] y;  //data
//  float maxRange;
//  int xsp, ysp;  //space x, y
// Constructer:
//  D2Graph(int _X_LENGTH, int _Y_LENGTH, String xL, String yL)
// Method:
//  void graphPointDraw(float _y)   //for realtime view
//  void graphStaticDraw(float[] y) //for static view
//  void graphArrayDraw(float[] y, String sw, float scale)
//     for realtime view, sw="P":point, sw="L":line
//  private void labels()
//  private void clear()
// -----------------------------------------------------------

class D2Graph {
    int X_LENGTH, Y_LENGTH;
    String X_LABEL, Y_LABEL;
    float[] y;  //data
    float maxRange;
    int xsp, ysp;  //space x, y

    D2Graph(int _X_LENGTH, int _Y_LENGTH, String xL, String yL) {
      X_LENGTH   = _X_LENGTH;
      Y_LENGTH   = _Y_LENGTH;
      X_LABEL = xL; Y_LABEL = yL;
      xsp = int((width-X_LENGTH)/2);
      ysp = int((height-Y_LENGTH)/2);
      y = new float[X_LENGTH];
      for (int i = 0; i < X_LENGTH; i++) {
        y[i] = 0;
      }
      maxRange = 1;
      labels();
    }

    void graphPointDraw(float _y) {
      y[X_LENGTH - 1] = _y;
      for (int i = 0; i < X_LENGTH - 1; i++) {
        y[i] = y[i + 1];
      }
      
      for (int i=0; i<X_LENGTH-1; i++) {
        maxRange = (abs(y[i]) > maxRange ? abs(y[i]) : maxRange);
      }

      pushMatrix(); {
        clear();
        
        translate(xsp, Y_LENGTH/2+ysp);
        scale(1, -1);
        strokeWeight(1);
        for (int i=0; i<X_LENGTH-1; i++) {
          stroke(255, 0, 0);
          line(i, y[i]*(Y_LENGTH/2)/maxRange, i+1, y[i+1]*(Y_LENGTH/2)/maxRange);
        }
      } popMatrix();
    }
    
    void graphStaticDraw(float[] y) {
      
      for (int i=0; i<X_LENGTH-1; i++) {
        maxRange = (abs(y[i]) > maxRange ? abs(y[i]) : maxRange);
      }

      clear();
        
      translate(xsp, Y_LENGTH/2+ysp);
      scale(1, -1);
      strokeWeight(1);
      for (int i=0; i<X_LENGTH-1; i++) {
        stroke(255, 0, 0);
        line(i, y[i]*(Y_LENGTH/2)/maxRange, i+1, y[i+1]*(Y_LENGTH/2)/maxRange);
      }
    }
    
     void graphArrayDraw(float[] y, String sw, float scale) {
       pushMatrix(); {
       clear();        
       translate(xsp, 0);

       strokeWeight(1);
       for (int i=0; i<y.length; i++) {
         stroke(255, 0, 0);
         float x = map(i, 0, y.length, 0, X_LENGTH);
         if (sw == "L")
           line(x, ysp+Y_LENGTH, x, ysp+Y_LENGTH - y[i]*scale);
         else if (sw == "P")
           point(x, ysp+Y_LENGTH - y[i]*scale);
       }
       } popMatrix();
     }   
  
     private void labels() {
       fill(240);
       stroke(130);
       strokeWeight(1);
       rect(xsp, ysp, X_LENGTH, Y_LENGTH);
       line(xsp, Y_LENGTH/2+ysp, X_LENGTH+xsp, Y_LENGTH/2+ysp);

       textSize(20); 
       fill(60);
       textAlign(RIGHT, CENTER);
       text(0, xsp, Y_LENGTH/2+ysp);
       text(nf(maxRange, 0, 1), xsp, ysp);
       text(nf(-1*maxRange, 0, 1), xsp, Y_LENGTH+ysp);

       fill(0);
       textSize(22);
       textAlign(CENTER, CENTER);
       text(X_LABEL, X_LENGTH/2+xsp, Y_LENGTH+ysp*3/2);        
       rotate(radians(-90));
       text(Y_LABEL, -(Y_LENGTH/2+ysp), xsp/2);
       rotate(radians(90));
    }

    private void clear() {
      fill(240);
      stroke(130);
      rect(xsp, ysp, X_LENGTH, Y_LENGTH);;
      line(xsp, Y_LENGTH/2+ysp, X_LENGTH+xsp, Y_LENGTH/2+ysp);
    }    
}
