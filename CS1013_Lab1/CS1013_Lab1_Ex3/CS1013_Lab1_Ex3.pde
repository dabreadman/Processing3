int i;

void setup() {
size(400, 400);
i=0;
frameRate(120);
}

void draw() {
i++;
background(255);
noStroke();fill(#E9967A);
rect(i,50,50,50);
if (i>=(400-50))  rect(i-399,50,50,50); //draws from out of bounds 
if (i>=400) i=0; //reset the value of i


}
