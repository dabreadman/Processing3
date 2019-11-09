class Shield{
  
  int x,y;
  int hp;
  
  Shield(int x,int y)
  {
    this.x=x; this.y=y;
    hp = 10;
  }
  void draw()
  {
    if (hp>0)
    {
    fill(255);
    rect(x,y,SHIELDWIDTH,SHIELDHEIGHT);
    }
    else
    {
      x=-50; y=-50;
    }
  }
  
  
  }
