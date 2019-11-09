class Screen {
  ArrayList<Widget> theWidgetList;
 // ArrayList<Checkbox> checkboxList;
  color backgroundColor;

  Screen(color theColor){
    backgroundColor = theColor; 
   // theWidgetList = theList;
   theWidgetList = new ArrayList<Widget>();
   //checkboxList = new ArrayList<Checkbox>();
   currentEvent = EVENT_NULL;
  }

  void draw() {
    for (int i = 0; i<theWidgetList.size(); i++) {
     Widget aWidget = (Widget)theWidgetList.get(i);
     aWidget.draw();
    }
  }
    
  //  for (int i = 0; i<checkboxList.size(); i++) {
   //   Checkbox checkbox = checkboxList.get(i);
   //   checkbox.draw();
  //  }
 // }

  int getEvent() {
    for (int i = 0; i<theWidgetList.size(); i++) {
      Widget aWidget = theWidgetList.get(i);
      int event = aWidget.getEvent(mouseX,mouseY);
      if (event!=EVENT_NULL)
      {
      return event;
      }
    }
    return EVENT_NULL;
  }
  
  void addWidget(Widget newWidget){
  theWidgetList.add(newWidget);
  }
  
//  void addCheckbox(Checkbox newCheckbox){
 // checkboxList.add(newCheckbox);
//  }
  
  ArrayList<Widget> getList(){
  return theWidgetList;
  }
  
  color getBackgroundColor(){
    return backgroundColor;
  }
}
