PFont stdFont;
Widget redW, greenW, blueW, forward, backward;
ArrayList currentList1, currentList2, currentList;
Screen screen1, screen2, screen;
color red,green,blue;

void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
   red = color (255, 0, 0);
  green = color (0, 255, 0);
  blue = color (0, 128, 180);
  redW   = new Widget(75, SCREENY/4, WIDGET_WIDTH, WIDGET_HEIGHT, "RED", red, stdFont, RED);
  greenW = new Widget(175, SCREENY/4, WIDGET_WIDTH, WIDGET_HEIGHT, "GREEN", green, stdFont, GREEN);
  blueW  = new Widget(275, SCREENY/4, WIDGET_WIDTH, WIDGET_HEIGHT, "BLUE", blue, stdFont, BLUE);
  forward = new Widget((SCREENX-WIDGET_WIDTH)/2, SCREENY/2, WIDGET_WIDTH, WIDGET_HEIGHT, "Forward", 255, stdFont, FORWARD);
  backward = new Widget((SCREENX-WIDGET_WIDTH)/2, SCREENY/2, WIDGET_WIDTH, WIDGET_HEIGHT, "Backward", 255, stdFont, BACKWARD);

  //currentList1 = new ArrayList();
  //currentList1.add(redW);
  //currentList1.add(greenW);
  //currentList1.add(blueW);
  //currentList1.add(forward);

  //currentList2 = new ArrayList();
  //currentList2.add(greenW);
  //currentList2.add(redW);
  //currentList2.add(backward);

  screen1 = new Screen (#FFFF99);//, currentList1);
  screen2 = new Screen (#FF99CC);//, currentList2);
  
  screen1.addWidget(redW);
  screen1.addWidget(blueW);
  screen1.addWidget(greenW);
  screen1.addWidget(forward);
 // screen1.addWidget(new Checkbox(70, 200, WIDGET_WIDTH, WIDGET_HEIGHT, "Backward", 255, stdFont, 11));
  
  screen2.addWidget(redW);
  screen2.addWidget(blueW);
  screen2.addWidget(backward);

  fill(255);
  noStroke();
  rect(SCREENX/2-WIDGET_WIDTH/2, SCREENY/4*3, 50, 50);
  screen = screen1;
  currentList = screen1.getList(); background(screen.getBackgroundColor());
}

void draw() { 
  screen.draw();
}

void mousePressed() {
  int event;
  
  event = screen.getEvent();
  
    if (event == FORWARD || event == BACKWARD)
    {
      if (event == FORWARD)
      {
        screen = screen2;
        currentList = screen2.getList();
      } 
      else
      {
        screen = screen1;
        currentList = screen1.getList();
      }
       background(screen.getBackgroundColor());
    } 
    else if (event!=EVENT_NULL)
    {
      color thecolor = 255;;
      if(event == RED)
      thecolor = red;
      if(event ==BLUE)
      thecolor = blue;
      if(event == GREEN)
      thecolor = green;
      fill(thecolor);
      stroke(thecolor);
      rect(SCREENX/2-WIDGET_WIDTH/2, SCREENY/4*3, 50, 50);
    }
  }


void mouseMoved() {
  int event;

  for (int i = 0; i<currentList.size(); i++) {
    Widget aWidget = (Widget) currentList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);

    if (event!=EVENT_NULL)
    {
      aWidget.setStroke();
    } else
    {
      aWidget.resetStroke();
    }
  }
}
