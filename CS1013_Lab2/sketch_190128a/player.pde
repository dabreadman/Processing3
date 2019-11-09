  class Player {
  int xpos; int ypos;
  color paddlecolor = color(50);
  
  Player(int screen_y)
  {
  xpos=SCREENX/2;
  ypos=screen_y;
  }
  void move(int x){
  if(x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
  else xpos=x;
  }
  void draw()
  {
  fill(paddlecolor);
  rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  
  
  //extra 2
  void moveComputer(float x,int count){
   if( x>xpos+PADDLEWIDTH) xpos = xpos + 2 + 2*count;
   if (x<xpos)             xpos = xpos - 2 - 2*count;
  }
  }
