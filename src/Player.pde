class Player {
  int x, y, health, damage, money;
  boolean moveW = true;
  String weapon, helmet, chestplate, trousers, boots;
  ArrayList<Shop> items;
  PImage sprite;

  Player() {
    this.x = x;
    this.y = y;
    this.health = health;
    this.money = money;
    this.damage = damage;
    this.weapon = weapon;
    items = new ArrayList<Shop>();
    this.sprite = loadImage("sprites/BlueGuy.png");
    this.sprite.resize(64, 64);
  }

  void attack(Enemy target, int damage) {
    target.health -= damage;
  }

  void attacked(Enemy target, int health) {
    target.damage -= health;
  }

  int getTotDmg(Item weapons) {
    return damage + weapons.getDmg();
  }

  void display() {
    image(this.sprite, x, y);
  }

  void move() {
    if (keyPressed) {
      if (key == 'w' && moveW == true && y>0) {
        y = y - 64;
        moveW = false;
      }
      if (key == 'a' && moveW == true && x>0) {
        x = x - 64;
        moveW = false;
      }
      if (key == 's' && moveW == true && y<544) {
        y = y + 64;
        moveW = false;
      }
      if (key == 'd' && moveW == true && x<544) {
        x = x + 64;
        moveW = false;
      }
    }
    if (!keyPressed) {
      moveW = true;
    }
  }
}
