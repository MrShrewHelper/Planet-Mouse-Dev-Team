class Platform {
  float x, y, w, h;
  color c;

  Platform(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = color(#5F0FA2);
  }

  void display() {
    fill(c);
    noStroke();
    rect(x, y, w, h);
  }

  boolean checkCollision(float px, float py, float pr, float vy) {
    if (vy >= 0) {
      if (px + pr > x && px - pr < x + w) {
        if (py + pr >= y && py + pr <= y + h) {
          return true;
        }
      }
    }
    return false;
  }
}
