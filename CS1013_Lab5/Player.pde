class Player {
  int xpos; 
  int ypos;
  color paddlecolor = color(255);
  int powerUp=0;
  int powerUpTime=0;

  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }

  void move(int x) {
    if (x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;
  }
  void draw()
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
}
