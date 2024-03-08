class Button {
  int x, y, w, h;
  char type;

  Button(int x, int y, int w, int h, char type) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.type = type;
  }

  boolean pressed() {
    if (mouseX < x+w && mouseX > x && mouseY < y+h && mouseY > y && mousePressed) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    rect(x, y, w, h);
  }
}
