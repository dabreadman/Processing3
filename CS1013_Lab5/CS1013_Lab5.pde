  import ddf.minim.*;
  
  Minim minim;
  AudioPlayer player, player2, winning, losing;
  AudioInput input;
  
  Alien theAliens[];
  PImage alienImage;
  PImage explodingImage;
  PImage currentImage;
  ArrayList<Bullet> theBullets;
  //ArrayList<Bomb> theBombs;
  Player thePlayer;
  int game = 0;
  PFont myFont;
  Shield shield;
  
  void settings() {
    size(SCREENX, SCREENY);
    alienImage = loadImage("spacer.GIF");
    explodingImage = loadImage("exploding.GIF");
  }
  
  void setup() {
    minim = new Minim(this);
    player = minim.loadFile("sound.mp3");
    player2 = minim.loadFile("sound2.mp3");
    winning = minim.loadFile("winning.mp3");
    losing = minim.loadFile("losing.mp3");
  
  
    game = UNDETERMINED;
    thePlayer = new Player(SCREENY-PADDLEHEIGHT);
    theAliens = new Alien[20];
    theBullets = new ArrayList<Bullet>();
    shield = new Shield(SCREENX/2-SHIELDWIDTH/2, SCREENY/2);
  
    //theBombs = new ArrayList<Bomb>();
    noStroke();
    PFont myFont = loadFont("AgencyFB-Reg-48.vlw");
    textFont(myFont);
  
    //theBombs.add( new Bomb(SCREENX/2,SCREENY/2));
    init_array(theAliens);
  }
  
  void draw() {
  
    if (game!=UNDETERMINED)
    {
      background(255);
      fill(20);
      if (game==WIN)
      {
        text("Game Over!! You won!", SCREENX/7, SCREENY/2);
        winning.play();
      } else
      {
        text("Game Over!! You lost!", SCREENX/7, SCREENY/2);
        losing.play();
      }
    } else
    {
      background(100);
      thePlayer.move(mouseX);
      thePlayer.draw();
      move_array(theAliens);
      draw_array(theAliens);
      move_bullet(theBullets);
      collide_bullet(theBullets);
      draw_bullet(theBullets);
      shield.draw();
    }
  }
  
  void move_bullet(ArrayList<Bullet> theBullets) {
    for (int i=0; i<theBullets.size(); i++) {
      theBullets.get(i).move();
    }
  }
  
  void draw_bullet(ArrayList<Bullet> theBullets) {
    for (int i=0; i<theBullets.size(); i++) {
      theBullets.get(i).draw();
    }
  }
  
  void collide_bullet(ArrayList<Bullet> theBullets) {
    for (int i=0; i<theBullets.size(); i++) {
      theBullets.get(i).collide(theAliens, shield);
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
    int count = theArray.length;
    for (int i=0; i<theArray.length; i++)
    {
      theArray[i].move();
      if (theArray[i].exploded == true)
      {
        count--;
      }
      if (count<=0)
        game = WIN;
    }
  }
  
  void mousePressed() {
    theBullets.add(new Bullet(mouseX));
    player.play();
  }
  
  void mouseReleased(){
    //  player.close();
      player = minim.loadFile("sound.mp3");
  }
