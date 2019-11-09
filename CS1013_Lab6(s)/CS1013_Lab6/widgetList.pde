PFont stdFont;
Widget redW, greenW, blueW;
ArrayList widgetList;

void settings() {
  size(SCREENX, SCREENY);
}
void setup() {

  color red = color (255, 0, 0);
  color green = color (0, 255, 0);
  color blue = color (0, 128, 180);

  redW   = new Widget(75, SCREENY/4, WIDGET_WIDTH, WIDGET_HEIGHT, "RED", red, stdFont, RED);
  greenW = new Widget(175, SCREENY/4, WIDGET_WIDTH, WIDGET_HEIGHT, "GREEN", green, stdFont, GREEN);
  blueW  = new Widget(275, SCREENY/4, WIDGET_WIDTH, WIDGET_HEIGHT, "BLUE", blue, stdFont, BLUE);
  widgetList = new ArrayList();
  widgetList.add(redW);
  widgetList.add(greenW);
  widgetList.add(blueW);
  
  fill(255);noStroke();
  rect(SCREENX/2-WIDGET_WIDTH/2, SCREENY/4*3, 50, 50);
}

void draw() { 
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget)widgetList.get(i);
    aWidget.draw();
    
  }
}

void mousePressed() {
  int event;

  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);

    if (event!=EVENT_NULL)
    {
      color thecolor =aWidget.getColor();
      fill(thecolor);stroke(thecolor);
      rect(SCREENX/2-WIDGET_WIDTH/2, SCREENY/4*3, 50, 50);
    }
  }
}

void mouseMoved(){
  int event;

  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);

    if (event!=EVENT_NULL)
    {
      aWidget.setStroke();
    }
    
    else
    {
      aWidget.resetStroke();
    }
  }
}
