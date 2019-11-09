PFont stdFont;
Widget blueW;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {

  color blue = color (0, 128, 180);
  blueW  = new Widget(275, 115, WIDGET_WIDTH, WIDGET_HEIGHT, "~DRAG~", blue, stdFont, BLUE);
 
  fill(255);
  rect(SCREENX/2-WIDGET_WIDTH/2, SCREENY/4*3, 50, 50);
}

void draw() { 
  {
    background(255);
    line(MARGIN,0,MARGIN,SCREENY);
    line(SCREENX-MARGIN,0,SCREENX-MARGIN,SCREENY);
    line(MARGIN,SCREENY/2+2,SCREENX-MARGIN,SCREENY/2+2);
    text(blueW.count(),SCREENX/2,SCREENY/2);
    blueW.draw();
  }
}

void mouseDragged(){
  blueW.move(mouseX);
}
