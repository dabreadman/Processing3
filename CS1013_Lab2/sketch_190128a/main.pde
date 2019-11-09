  Player thePlayer;
  Ball theBall;
  void settings() {
    size(SCREENX+50, SCREENY+1);
  }
  void setup() {
    thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
    theBall = new Ball();
    ellipseMode(RADIUS);
    frameRate(100);
    PFont myFont = loadFont("AgencyFB-Reg-18.vlw");
    textFont(myFont);  
     fill(206);
     rect(SCREENX,0,50,SCREENY);
  }
  
  void draw() {
     fill(255);
     stroke(10);
    rect(0,0,SCREENX,SCREENY);
    thePlayer.move(mouseX);
    theBall.move();
    theBall.collide(thePlayer);
  
    // rect(SCREENX,0,50,SCREENY);
       
   
    thePlayer.draw();
    theBall.draw();
  }
  
  void mousePressed() {
    theBall.reset();
  }
