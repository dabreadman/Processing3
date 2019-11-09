class Widget {
  int x, y, width, height;
  String label; int event;
  color widgetColor, labelColor,strokeColor;
  PFont widgetFont;

  Widget(int x,int y, int width, int height, String label,
  color widgetColor, PFont widgetFont, int event){
    this.x=x; this.y=y; this.width = width; this.height= height;
    this.label=label; this.event=event; 
    this.widgetColor=widgetColor; this.widgetFont=widgetFont;
    labelColor= color(0);
   }
  void draw(){
    stroke(strokeColor);
    fill(widgetColor);
    rect(x,y,width,height);
    fill(labelColor);
    text(label, x+10, y+height-10);
   // if(strokeColor!=widgetColor)
   // strokeColor = widgetColor;
  }
  
  void move(int mX){
    if(x>MARGIN && x+WIDGET_WIDTH<SCREENX-MARGIN)
    {
    if(mX>SCREENX-width-MARGIN)
    mX=SCREENX-MARGIN-width;
    else if(mX<MARGIN)
    mX=MARGIN;
    x=mX;
    }
    else
    {
      if (x<SCREENX/2)
      x++;
      else
      x--;
    }
  }
  
  int count(){
    int count = (int)((x-85)/2.3);
    if(count==99)
    count++;
    if (count>100)
    count=100;
    if(count<0)
    count=0;
    return count;
  }
}
