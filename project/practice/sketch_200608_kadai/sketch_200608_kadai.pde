  double easing = 0.05;  //delay of point
   float posX = 0;     //position X
   float posY = 0;     //position Y
 
   //初期処理関数
   void setup() {
      size(400, 400);  //window
      background(255, 255, 255);  //white
      noStroke();  //lineless
      fill(0,0,0);  //black      
   }

   //描画処理関数
   void draw() {
      if (mousePressed == true) {
         posX = posX + (mouseX - posX) * (float)easing;
         posY = posY + (mouseY - posY) * (float)easing;
         ellipse(posX, posY, 10, 10); //circle
      }
      else
      {
        posX = mouseX;
        posY = mouseY;
      }
   }

   void keyPressed() {
      if(key == 'r'){
        fill(255,0,0);    //red
      }else if(key == 'g'){
        fill(0,255,0);  //yellow
      }else if(key == 'b'){
        fill(0,0,255);      //blue
      }else if(key == 'y'){
        fill(255,255,0);      //yellow
      }else if(key == 'w'){
        fill(255,255,255);    //white
      }
   }

