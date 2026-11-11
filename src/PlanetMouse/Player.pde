// Dylan Cheng

class Player {
  int x, y, w, h, health;
  color c1;
  PImage p1;

  // Constructor
  Player() {
    x = 500;
    y = 50;
    w = 90; 
    h = 90; 
    health = 100;
    c1 = color(#00FF39);
    p1 = loadImage("image.png");
  }

 
  void display () {
    image(p1, 200, y, w, h);
  }

  void move (char dir) {
  }

  void fire () {
  }

  void attack () {
  }
}
