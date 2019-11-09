int i;

void setup() {
size(400, 400);
i=-50;
frameRate(144);
}

void draw() {
background(255);
i++;
if (i>=400) i=-50;
noStroke();fill(#E9967A);
rect(i,50,50,50);

}
