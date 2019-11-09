class Bullet {
  int velocity;
  int xpos;
  int ypos;

  Bullet(int x) {
    xpos=x+PADDLEWIDTH/2-BULLETWIDTH/2;
    ypos = SCREENY-PADDLEHEIGHT+BULLETHEIGHT;
  }
  void draw() {
    fill(255);
    rect(xpos, ypos, BULLETWIDTH, BULLETHEIGHT);
  }

  void move() {
    ypos-=5;
  }

  void collide (Alien[] theAliens,Shield shield) {
    for (int i=0; i<theAliens.length; i++) {
      
      //alien
      if (xpos>theAliens[i].x && xpos+BULLETWIDTH<theAliens[i].x+PIXELWIDTH && ypos>theAliens[i].y && ypos+BULLETHEIGHT<theAliens[i].y+PIXELHEIGHT) {
        if (!theAliens[i].exploded)
          theAliens[i].die();
      }
      
      //shield
      if (xpos>shield.x && xpos+BULLETWIDTH<shield.x+SHIELDWIDTH && ypos>shield.y && ypos+BULLETHEIGHT < shield.y+SHIELDHEIGHT){
           shield.hp--;
           println("hit");
           xpos = -50; ypos=-50 ; velocity = 0;
           player2.play();
      }
    }
  }
}
