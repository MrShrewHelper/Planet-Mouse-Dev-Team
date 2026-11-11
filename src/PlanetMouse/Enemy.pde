// Amani Liu

class Enemy {
  int x, y, w, h, health;
  color c1;
  PImage e1;

  Enemy() {
    x = 50;
    y = 50;
    w = 90; 
    h = 90; 
    health = 100;
    c1 = color(#FF0000);
    e1 = loadImage("enemy.png");
  }

  void display () {
    image(e1, x, y, w, h);
  }

  void move (char dir) {
  }

  void fire () {
  }

  void attack () {
  }
}
