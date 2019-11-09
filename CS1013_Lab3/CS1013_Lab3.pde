    Alien theAliens[];
    PImage alienImage;
    PImage explodingImage;
    PImage currentImage;
    float frame;
    
    void settings(){
    size(SCREENX, SCREENY);
    alienImage = loadImage("spacer.GIF");
    explodingImage = loadImage("exploding.GIF");
    }
    
    void setup() {
    theAliens = new Alien[10];
    noStroke();
    init_array(theAliens);
    //explode_array(theAliens);
    }
    
    void draw(){
      frameRate(BASEFRAMERATE+frame);
      if(frame<120)
      frame+=0.05;
      
    background(100);
    move_array(theAliens);
    draw_array(theAliens);
    }
    
    void init_array(Alien theArray[]){
    for(int i=0; i<theArray.length; i++)
    {
    theArray[i] = new Alien(random(1)*SCREENX,random(1)*SCREENY/1.5,random(1,3),random(1));
    }
    }
    
    void draw_array(Alien theArray[]){
    for(int i=0; i<theArray.length; i++)
    theArray[i].draw();
    }
    
    void move_array(Alien theArray[]){
    for(int i=0; i<theArray.length; i++)
    theArray[i].move();
    }
    
    //void explode_array (Alien theArray[]){
    //  for(int i=0; i<theArray.length; i++)
      
    //theArray[i].explode();
    //}
