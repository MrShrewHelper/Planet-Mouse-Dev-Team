// David Madden, Amani Liu, Jayden Liu, Dylan Cheng
Player p1;
Enemy e1;


void setup() {
  size(1000, 1000);
  p1 = new Player();
  e1 = new Enemy();
}

void draw() {
  background(127);
  p1.display();
  e1.display();
}
    
void keypressed() {
}

void mousePressed () {
}
