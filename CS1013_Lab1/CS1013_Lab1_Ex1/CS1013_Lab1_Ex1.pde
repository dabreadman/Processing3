int i;

void setup() {
size(400, 400);
i=0;
frameRate(200);
}

void draw() {
background(255);
i++;
noStroke();fill(#E9967A);
rect(50-i,0,50,50);
noStroke();fill(#E8837A);
rect(80+i,20,50,50);
noStroke();fill(#E9FFAA);
rect(70,30+i,50,50);
}
