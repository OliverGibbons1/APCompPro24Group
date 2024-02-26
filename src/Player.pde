class Player {
  int x, y, health, damage, money, maxHealth;
  int moveW = 0;
  String weapon, helmet, chestplate, trousers, boots;
  ArrayList<Shop> items;
  PImage sprite;

  Player() {
    this.x = x;
    this.y = y;
    this.health = health;
    this.maxHealth = maxHealth;
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
    return damage;// + weapons.getDmg();
  }

  void display() {
    image(this.sprite, x, y);
  }

  void move() {
    if (keyPressed) {
      if (key == 'w' && moveW==0 && y>0) {
        y = y - 64;
      }
      if (key == 'a' && moveW == 0 && x>0) {
        x = x - 64;
      }
      if (key == 's' && moveW == 0 && y<544) {
        y = y + 64;
      }
      if (key == 'd' && moveW == 0 && x<544) {
        x = x + 64;
      }
      moveW+=1;
    }
    if (!keyPressed || moveW>=30) {
      moveW = 0;
    }
  }
}
