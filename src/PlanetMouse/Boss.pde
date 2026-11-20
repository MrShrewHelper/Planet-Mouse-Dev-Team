// David Madden
class Boss {
  int x, y, w, h, health, damage;
  PImage Juan;

  Boss() {
    x = 50;
    y = 50;
    w = 150;
    h = 150;
    health = 100000000;
    damage = 25;
    Juan = loadImage("boss.png");
  }

  void display() {
    if (Juan != null) {
      image(Juan, x, y, w, h);
    } else {
      fill(150, 0, 200);
      rect(x, y, w, h);
    }
  }

  void move(char dir) {
  }
}
