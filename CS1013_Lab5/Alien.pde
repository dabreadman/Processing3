class Alien {
  int x, y;
  int phase;
  int downCount = 0;
  boolean exploded=false;  
  PImage normalImg, explodeImg, currentImg;
  int corpseTime;
  boolean hasBomb=true;
  Bomb alienBomb;

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

  void die() {
    exploded = true;
    corpseTime = 100;
    currentImg = explodeImg;
  }

  void draw() {
    if (exploded && corpseTime<=0)
    {
    } else
    {

      image(currentImg, x, y);

      if (hasBomb)
      {
        if (random(1, 500)>499)
        {
          generateBomb();
        }
      } else
      {
        if (alienBomb.offScreen())
          hasBomb=true;
      }

      if (corpseTime>0)
        corpseTime--;
    }
    if (alienBomb!=null)
      alienBomb.draw();
  }

  void generateBomb()
  {
    alienBomb = new Bomb (x, y);
    hasBomb = false;
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
    if (!hasBomb)
    {
      alienBomb.move();
      alienBomb.collideShield(shield);
      if (alienBomb.collide(thePlayer))
      {
        game = LOSE;
      }
    }
  }
}
