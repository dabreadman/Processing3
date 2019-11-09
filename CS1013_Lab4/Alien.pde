  class Alien {
    float x, y;
    int phase;
    int downCount = 0;
    boolean exploded=false;  
    PImage normalImg, explodeImg, currentImg;
    int corpseTime;
    boolean powerUped=false;
  
    Alien (int xpos, int ypos, PImage alienImage, PImage explodingImage, int layer) {
      x = xpos;
      y = ypos;
      normalImg=alienImage;
      explodeImg=explodingImage;
      currentImg=alienImage;
      if (layer%2==1)
        phase=RIGHT;
      else
        phase=LEFT;
    }
  
    void die(Player theplayer) {
      exploded = true;
      corpseTime = 100;
      currentImg = explodeImg;
      if (random(1, 500)>450)
      {
        currentImg = powerUpImg;
        thePlayer.powerUpTime=100;
        if (thePlayer.powerUp==0)
        thePlayer.powerUp=(int)random(1, 10);
      }
    }
  
    void draw() {
      if (exploded && corpseTime<=0)
      {
      } 
      else
      {
        image(currentImg, x, y);
        if (corpseTime>0)
          corpseTime--;
      }
    }
  
      void move() {
        if (downCount>0)
        {
          y++;
          downCount--;
        } else {
          if (phase==RIGHT) {
            if (x+normalImg.width<SCREENX-1)
              x++;
            else {
              phase=LEFT;
              downCount = PIXELHEIGHT+GAP;
            }
          } else if (x>0) x--;
          else {
            phase=RIGHT;
            downCount = PIXELHEIGHT+GAP;
          }
        }
      }
    }
