int i;
float k;
int c1;
int c2;
int c3;



void setup() {
size(400, 400);
i=0-50; //started drawing from out of bounds into bounds
k=0;
c1=220;
c2=0;
c3=0;
frameRate(80);
}

void draw() {
background(255);

//obj1 colour 
if (c2>0 && c2<=100){       
  noStroke();fill(c1,c2+30,40-c3);
}
if (c2>100 && c2<=200){
  noStroke();fill(c1,230-c2,40-c3);
}
//obj1 sine phase
rect(i,200+100*sin(k),50,50);
if (i>350)  rect(i-400,200+100*sin(k),50,50); //when object started going out of bounds

//obj2 colour
if (c2>0 && c2<=100){
  noStroke();fill(c1,c2+100,155-c3);
}
if (c2>100 && c2<=200){
  noStroke();fill(c1,300-c2,155-c3);
}
//obj2 sine phase
rect(350-i,100+100*sin(k),50,50);
if (i>350)  rect(749-i,100+100*sin(k),50,50); //when object started going out of bounds

//variables
c2++;
c3++;
i++;
k=k+0.1;
if (k>=360) k=0;//reset value of k
if (i>=400) i=0; //out of bounds reset
if (c2>240) c2=0;
if (c3>=255) c3=00;

}
