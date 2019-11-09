                            class Ball {
                            float x; float y;
                            float dx; float dy;
                            int radius,lives,tempMouseX;
                            int countRoof,countPaddle,count;
                            color ballColor = color(200, 100, 50);
                            
                            Ball(){
                            x = (SCREENX/2);
                            y = (SCREENY/4);
                            dx = 0; dy = 2;
                            radius=5;
                            count = 0 ;
                            countRoof = 0;
                            }
                            
                            void move(){
                            x = x+dx; y = y+dy;
                            }
                            
                            void draw(){
                         
                              //speed control
                            if (dx>=6) dx-=1;
                            if (dx<=-6) dx+=1;  
                            if (dy>=6) dy-=1;
                            if (dy<=-6) dy+=1;
                            
                            //gravity
                            //if(dy<0) dy-=0.001;
                            
                            //draws the ball
                            fill(ballColor);
                            ellipse(int(x), int(y), radius,
                            radius);
                            }
                            
                            void reset(){
                            x = (SCREENX/2);
                            y = (SCREENY/4);
                            dx = 0; dy = 2;
                            fill(206);
                            rect(SCREENX,0,50,SCREENY);
                           
                            fill(0);
                            text("Player: "+count,SCREENX+4,50);                      //scoreboard
                                text("Comp: "+countRoof,SCREENX+4,100);
                            }
                            
                            void collide(Player tp, int mouseX, Player tc){
                                
                             if(y+radius<=-10 ) //top wall
                             {
                               count++;
                              x = SCREENX/2 ;  y=SCREENY/2;
                              dx=0; dy=0;
                             }
                          
                             if( y-radius>=SCREENY) //bottom wall
                             {
                               countRoof++;
                              
                                x = SCREENX/2 ;  y=(SCREENY+1)/2;
                              dx=0; dy=0;
                             } 
                            if (x-radius<=0 || x+radius>=SCREENX)dx=-dx;    //left wall; right wall
                          
                            if((x+(1.0)*radius)<=tp.xpos && y+(0.5)*radius >= tp.ypos) //paddle left
                              if(sqrt(sq(x-tp.xpos)+sq(y-tp.ypos))<=radius)
                              {
                                 if (dx<=0)dx-=ACCELERATIONX;
                                else if (dx>0) dx+=ACCELERATIONX;
                                 if (dy<=0)dx-=ACCELERATIONY;
                                 else if (dy>0) dx+=ACCELERATIONY;
                                 x-=2; y-=2;
                                 if(x>=tp.xpos) x=tp.xpos-radius;
                                 dy=-dy;
                               
                              };                                      
                          
                           
                          if((x)<=tp.xpos+PADDLEWIDTH)                                //paddle right
                           {
                             if(sqrt(sq(x-tp.xpos)+sq(y-tp.ypos))<=radius)
                           {
                             dx=-dx;
                             dy=-dy;
                             x+=1;
                           }
                           }
                           
                            if (y+radius >= tp.ypos && x+radius > tp.xpos && x-radius < tp.xpos+ PADDLEWIDTH && y-radius<tp.ypos+PADDLEHEIGHT) //top/bottom paddle side
                            {
                              countPaddle++;
                              y-=2  ; //prevent stick glitch               
                                 if (dx<=0)dx-=ACCELERATIONX;
                                 if (dx>0) dx+=ACCELERATIONX;
                                 if (dy<=0)dy-=ACCELERATIONY;
                                 if (dy>0) dy+=ACCELERATIONY;
                                dy=-dy;
                                dy-=1;

                              if( /*countRoof >=0 &&*/ countPaddle >=0)
                              {
                                //countRoof--;
                                countPaddle--;
                                //count++;
                                background(206);
                                fill(30);
                                text("Player: "+count,SCREENX+4,50);
                                text("Comp: "+countRoof,SCREENX+4,100);
                              }                         
                              
                              //extra credit 1
                              
                              if (mouseX>tempMouseX) dx+=5;
                              else if (mouseX<tempMouseX) dx-=5;
                              
                              tempMouseX=mouseX;
                            }                   
                            
                            if (y+radius >= tc.ypos && x+radius > tc.xpos && x-radius < tc.xpos+ PADDLEWIDTH && y-radius<tc.ypos+PADDLEHEIGHT) //bottom computer side
                            {
                              dy=-dy;
                            }
                         }                       
                          }
                        
                          
                            
                            
                            
