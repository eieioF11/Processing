public class BOTTON
{
  String label;
  int btx,bty;
  int wi,hi;
  int[] COLOR=new int[3];
  boolean BT=false;
  final int sec=2; //秒数を設定
  
  BOTTON(String label,int btx,int bty,int wi,int hi,int red,int blue,int green)
  {
    this.label=label;
    this.btx=btx;
    this.bty=bty;
    this.wi=wi;
    this.hi=hi;
    this.COLOR[0]=red;
    this.COLOR[1]=blue;
    this.COLOR[2]=green;
  }
  boolean status()
  {
    fill(COLOR[0]/*red*/,COLOR[1]/*green*/,COLOR[2]/*blue*/);//0~255
    rect(btx/*x*/,bty/*Y*/,wi/*haba*/,hi/*takasa*/);
    textSize(40);
    fill(0,255,255);
    text(label,btx,bty+(hi/4),300,100);
    
    if(mousePressed == true&&btx+wi>mouseX&&btx<mouseX&&bty+hi>mouseY&&bty<mouseY)
      BT=true;
    if(BT)
    {
      fill(100/*red*/,100/*green*/,100/*blue*/);//0~255
      rect(btx/*x*/,bty/*Y*/,wi/*haba*/,hi/*takasa*/);  
      if(millis()>sec*1000)
      {
        BT=false;
        return true;
      }
    }
    return false;    
  }
}
