class Bomb{
  int x,y;
  int velocity;
  
  Bomb(int xpos, int ypos)
  {
   x=xpos; y=ypos; 
   velocity = 1;
  }
  
  void move(){
    y+=velocity;
  }
  
  void draw(){
    fill(20);
    rect(x,y,BOMBWIDTH,BOMBHEIGHT);
  }
  
  boolean offScreen(){
    if (y>SCREENY)
    return true;
    else
    return false;
  }
  
  void collideShield(Shield shield){
    if (x>shield.x && x+BULLETWIDTH<shield.y+SHIELDWIDTH && y>shield.y && y+BULLETHEIGHT < shield.y+SHIELDHEIGHT){
           shield.hp--;
           println("hit");
          y= SCREENY+50; velocity = 0; 
          player2.play();
      }
  }
  
  boolean collide(Player thePlayer){
    if (game==UNDETERMINED && x>thePlayer.xpos && x+BOMBWIDTH<thePlayer.xpos+PADDLEWIDTH && y>thePlayer.ypos && y+BOMBHEIGHT < thePlayer.ypos+PADDLEHEIGHT)
    {
      player.play();
    return true;
    }
    else 
    return false;
  }
}
