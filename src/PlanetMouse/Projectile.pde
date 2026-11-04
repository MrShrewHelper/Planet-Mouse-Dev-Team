// Jayden Liu

class Projectile {
  // Member variables
  int x, y, w, h, dmg;
  PImage p1;


  // Constructor
  Projectile () {
    x = 50;
    y = 50;
    w = 10;
    h = 10;
    dmg = 5;
    p1 = loadImage("enemy.png");
  }
  
  // Member Methods
  void display() {
    image(p1,x,y);
  }
  void move (char dir) {
  }
}
