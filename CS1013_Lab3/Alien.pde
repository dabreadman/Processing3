        class Alien {
        float x,y;
        int phase;
        int downCount = 0;
        boolean canDown = true;
        boolean keepDraw = true;
        float explode;
        boolean exploded;
        float incY,sinValue;
        boolean isSin;
     
        
        Alien(float xpos,float ypos,float random,float anotherRandom){
          x = xpos; y=ypos; phase = (int)random; 
          if(anotherRandom < 0.5)
          isSin=true;
          else
          isSin=false;
        }
        void draw(){
          
          //sin while not DOWN-ing
            if(phase!=DOWN && isSin)
             {
              incY=sin(sinValue);
              y+=incY;
              sinValue+=0.05;
              if (sinValue>=360)
              sinValue=0;
             }
             
          if(keepDraw)
          {
            if(!exploded)
            {
              explode = random(10);
              if (explode(explode))
              {
                currentImage = explodingImage;
                exploded=true;
              }
            else
              {
                currentImage = alienImage;
              }
               image(currentImage,x,y);
            }
            else
            {
               image(explodingImage,x,y);
            }
            
          }
        }
        
        void move(){
          
          //out of screen
          if(y>=SCREENY)
          keepDraw = false;
          
          //checks if around border
           if(((x<=MARGIN || x>SCREENX-MARGIN-PIXELWIDTH) && downCount <= 0)&& canDown)
          {
            phase = DOWN;
            downCount = PIXELHEIGHT;
            canDown = false;
          }
          
          //set the ability to down
          if(!canDown && ((x>MARGIN && x<=SCREENX-MARGIN-PIXELWIDTH)))
            canDown = true;
          
          //if DOWN-ing
          if (phase==DOWN)
          {
            if (downCount>0)
            {
            y++;
            downCount--;
            }
            //after finished DOWN-ing, set the direction
            else
            if( x <SCREEN/2)
            phase = RIGHT; 
            else
             phase = LEFT;        
          }
          //if RIGHT-ing
          else if (phase ==RIGHT)
          {
            x++;
          }
          //if LEFT-ing
          else 
          {
            x--;
          }
        }
        
        boolean explode(float number)
        {   
         if (number>=9.985)
         return true;
         else return false;
        }
        
        
        }
