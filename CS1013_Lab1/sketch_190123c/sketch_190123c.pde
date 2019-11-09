int i;

void setup() {
size(400, 400);
i=0;
frameRate(200);
}

void draw() {
background(255);
noStroke();fill(#E9967A);
rect(i,50,50,50);
if (i>350)  rect(i-400,50,50,50);
i++;
if (i>=400) i=0;


}
