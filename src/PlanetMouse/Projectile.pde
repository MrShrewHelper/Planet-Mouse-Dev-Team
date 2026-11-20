// Jayden Liu
class Projectile {
  int x, y, w, h, dmg;
  PImage p1;

  Projectile() {
    x = 50;
    y = 50;
    w = 10;
    h = 10;
    dmg = 5;
    p1 = loadImage("enemy.png");
  }
  
  void display() {
    if (p1 != null) {
      image(p1, x, y, w, h);
    } else {
      fill(255, 200, 0);
      ellipse(x, y, w, h);
    }
  }

  void move(char dir) {
  }
}
