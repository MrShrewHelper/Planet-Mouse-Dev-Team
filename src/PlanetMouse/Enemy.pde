// Amani Liu

class Enemy {
  // Member Variable
  int x,y,w,h,health;
  color c1;
  PImage e1:

  // Constructor
  Enemy() {
  x = 50;
  y = 50;
  w = 50;
  h = 50;
  health = 100;
  c1 = color(0);
  e1 = loadImage("");
}
  
// Member Methods
void display () {
// TODO: add image and remove rect
// image(e1,x,y);
  fill(c1);
  rect(x,y,w,h);

}
void move (char dir) {}
void fire () {}
void attack () {}

}
