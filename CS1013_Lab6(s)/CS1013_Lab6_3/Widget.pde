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
    strokeColor = widgetColor;
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
  int getEvent(int mX, int mY){
     if(mX>x && mX < x+width && mY >y && mY <y+height){
        return event;
     }
     return EVENT_NULL;
  }
  
  color getColor (){
    return widgetColor;
  }
  
  void setStroke(){
  strokeColor = 255;
  }
  
  void resetStroke(){
  strokeColor = widgetColor;
  }
}
 
class Checkbox extends Widget { 
  boolean check;
  Checkbox(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event)
  { 
    super(x, y, width, height, label, widgetColor, widgetFont, event);
    check = false;
  }
  
  void draw(){
    if (!check)
    {
    stroke(0);
    fill(widgetColor);
    rect(x, y, width, height);
    rect(x-WIDGET_WIDTH/2,y,width/2,height);
    fill(labelColor);
    text(label, x+10, y+height-10);
    }
    else
    {
    stroke(0);
    fill(widgetColor);
    rect(x, y, width, height);
    fill(0);
    rect(x-WIDGET_WIDTH/2,y,width/2,height);
    text(label, x+10, y+height-10);
    }
  }
  
   int getEvent(int mX, int mY){
     if(mX>x && mX < x+width && mY >y && mY <y+height){
         check = !check;
         println(check);
         println("check");
        return event;
     }
     return EVENT_NULL;
  }  
}

  
   
  
  
  
