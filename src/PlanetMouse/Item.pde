class Item {
  float x, y, w, h;
  boolean collected;

  Item(float x, float y) {
    this.x = x;
    this.y = y;
    this.w = 25;
    this.h = 25;
    this.collected = false;
  }

  void display() {
    if (!collected) {
      fill(255, 215, 0);
      ellipse(x, y, w, h);
    }
  }
}
