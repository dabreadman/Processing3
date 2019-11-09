int i;

void setup() {
size(400, 400);
noStroke();
i=0-50;
frameRate(80);
}

void draw() {
background(255);

fill(#E9967A);
rect(i,50,50,50);
if (i>350)  rect(i-399,50,50,50);

fill(#E996BB);
rect(350-i,150,50,50);
if (i>350)  rect(749-i,150,50,50);

i++;
if (i>=400) i=0;// reset the value of i
}
