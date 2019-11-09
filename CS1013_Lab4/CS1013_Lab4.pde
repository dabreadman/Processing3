  Alien theAliens[];
  PImage alienImage;
  PImage explodingImage;
  PImage currentImage;
  PImage powerUpImg;
  ArrayList<Bullet> theBullets;
  Player thePlayer;
  
  void settings() {
    size(SCREENX, SCREENY);
    alienImage = loadImage("spacer.GIF");
    explodingImage = loadImage("exploding.GIF");
    powerUpImg = loadImage("powerUp.GIF");
  }
  
  void setup() {
    thePlayer = new Player(SCREENY-PADDLEHEIGHT);
    theAliens = new Alien[40];
    theBullets = new ArrayList<Bullet>();
    noStroke();
    init_array(theAliens);
    //frameRate(10);
  }
  
  void draw() {
    background(100);
    thePlayer.move(mouseX);
    thePlayer.draw();
    move_array(theAliens);
    draw_array(theAliens);
    move_bullet(theBullets);
    collide_bullet(theBullets);
    draw_bullet(theBullets);
  }
  
  void move_bullet(ArrayList<Bullet> theBullets) {
    for (int i=0; i<theBullets.size(); i++) {
      theBullets.get(i).move(thePlayer);
    }
  }
  
  void draw_bullet(ArrayList<Bullet> theBullets) {
    for (int i=0; i<theBullets.size(); i++) {
      theBullets.get(i).draw(thePlayer);
    }
  }
  
  void collide_bullet(ArrayList<Bullet> theBullets) {
    for (int i=0; i<theBullets.size(); i++) {
      theBullets.get(i).collide(theAliens, thePlayer);
    }
  }
  
  void init_array(Alien theArray[]) {
    int xpos, ypos;
  
  
    for (int i=0; i<theAliens.length; i++) {
      xpos = i*PIXELWIDTH;
      ypos = 30;
      int layer=0;
      while (xpos>SCREENX-PIXELWIDTH)
      {
        xpos -= SCREENX;
        ypos+=GAP+PIXELHEIGHT;
        layer++;
      }
      theAliens[i] = new Alien (xpos, ypos, alienImage, explodingImage, layer);
    }
  }
  
  void draw_array(Alien theArray[]) {
    for (int i=0; i<theArray.length; i++)
      theArray[i].draw();
  }
  
  void move_array(Alien theArray[]) {
    for (int i=0; i<theArray.length; i++)
      theArray[i].move();
  }
  
  void mousePressed() {
    switch (thePlayer.powerUp) {
    case 0:
      theBullets.add(new Bullet(mouseX));
      break;
    case LASER:
      break;
    case ASSISTANT:
     theBullets.add(new Bullet(mouseX));
      theBullets.add(new Bullet(SCREENX/8));
       theBullets.add(new Bullet(7*SCREENX/8));
    
    break;
    default:
      theBullets.add(new Bullet(mouseX-BULLETWIDTH-GAP));
      theBullets.add(new Bullet(mouseX+BULLETWIDTH+GAP));
      break;
    }
  }
