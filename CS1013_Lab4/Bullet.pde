class Bullet {
  int velocity;
  int xpos;
  int ypos;

  Bullet(int x) {
    xpos=x+PADDLEWIDTH/2-BULLETWIDTH/2;
    ypos = SCREENY-PADDLEHEIGHT+BULLETHEIGHT;
  }
  void draw(Player thePlayer) {
    fill(255);
    if (thePlayer.powerUp!=LASER)
      rect(xpos, ypos, BULLETWIDTH, BULLETHEIGHT);
    else
      rect(xpos, 0, BULLETWIDTH, SCREENY*2);
  }

  void move(Player thePlayer) {
    if (thePlayer.powerUp!=LASER)
      ypos-=5;
    else
      xpos=mouseX+PADDLEWIDTH/2;
  }

  void collide (Alien[] theAliens, Player thePlayer) {
    for (int i=0; i<theAliens.length; i++) {
      if (thePlayer.powerUp!=LASER)
      {
        if (xpos>theAliens[i].x && xpos+BULLETWIDTH<theAliens[i].x+PIXELWIDTH && ypos>theAliens[i].y && ypos+BULLETHEIGHT<theAliens[i].y+PIXELHEIGHT) {
          if (!theAliens[i].exploded)
            theAliens[i].die(thePlayer);
        }
      } else
        if (xpos>theAliens[i].x && xpos+BULLETWIDTH<theAliens[i].x+PIXELWIDTH)
          if (!theAliens[i].exploded)
            theAliens[i].die(thePlayer);
    }
  }
}
