class Player {
  int x, y, w, h, health;
  color c1;
  PImage p1;

  Player() {
    x = 500;
    y = 50;
    w = 90; 
    h = 90; 
    health = 100;
    c1 = color(#00FF39);
    p1 = loadImage("character.png");
  }
  
  void display() {
    if (p1 != null) {
      image(p1, x, y, w, h);
    } else {
      fill(c1);
      rect(x, y, w, h);
    }
  }

  void move(char dir) {
  }

  void fire() {
  }

  void attack() {
  }
}
