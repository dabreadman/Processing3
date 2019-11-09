  Player thePlayer;
  Player theComputer;
  
  Ball theBall;
  void settings() {
    size(SCREENX+50, SCREENY+1);
  }
  void setup() {
    thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
    theComputer = new Player (0);
    theBall = new Ball();
    ellipseMode(RADIUS);
    frameRate(80);
    PFont myFont = loadFont("AgencyFB-Reg-18.vlw");
    textFont(myFont);
    background(255);
    fill(0);
    text("Beat the computer 3 times to win!",SCREENX/2-40,SCREENY/2);
     delay(2000);
     fill(206);
     rect(SCREENX,0,50,SCREENY);
     
  }
  
  void draw() {
    if (theBall.countRoof<3 && theBall.count<3)
    {
      fill(255);
       noStroke();
       rect(0,0,SCREENX+48,SCREENY);
     fill(0);
      text("Player: "+theBall.count,SCREENX+4,50);
                                text("Comp: "+theBall.countRoof,SCREENX+4,100);
    }
    
    if (theBall.countRoof>=3)
     {
       fill(255);
       noStroke();
       rect(0,0,SCREENX+48,SCREENY);
     fill(0);
     text("Game over!",SCREENX/2-25,SCREENY/2);
     }
     
   
    fill(255);
     stroke(10);
    rect(0,0,SCREENX,SCREENY);
    //theComputer.move((int)theBall.x-PADDLEWIDTH/2);
    theComputer.moveComputer(theBall.x,theBall.count);
    thePlayer.move(mouseX);
    theBall.move();
    theBall.collide(thePlayer,mouseX,theComputer);
    thePlayer.draw();
    theComputer.draw();
    theBall.draw();
    if(theBall.count>=3)
    {
     fill(255);
      noStroke();
     rect(0,0,SCREENX+50,SCREENY+1);
     fill(0);
     text("You have won!",SCREENX/2-25,SCREENY/2);
    
    } 
  }
  
  void mousePressed() {
    theBall.reset();
  }
