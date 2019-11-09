class Screen {
  ArrayList<Widget> theWidgetList;
  color backgroundColor;

  Screen(color theColor){//, ArrayList<Widget> theList) { 
    backgroundColor = theColor; 
   // theWidgetList = theList;
   theWidgetList = new ArrayList<Widget>();
  }

  void draw() {
    for (int i = 0; i<theWidgetList.size(); i++) {
      Widget aWidget = (Widget)theWidgetList.get(i);
      aWidget.draw();
    }
  }

  int getEvent() {
    for (int i = 0; i<theWidgetList.size(); i++) {
      Widget aWidget = (Widget)theWidgetList.get(i);
      int event = aWidget.getEvent(mouseX,mouseY);
      if (event!=EVENT_NULL && event!=CHECKED)
      return event;
    }
    return EVENT_NULL;
  }
  
  void addWidget(Widget newWidget){
  theWidgetList.add(newWidget);
  }
  
  ArrayList<Widget> getList(){
  return theWidgetList;
  }
  
  color getBackgroundColor(){
    return backgroundColor;
  }
}
