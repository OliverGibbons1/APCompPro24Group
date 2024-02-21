class Enemy {
  int health, damage, money;
  PImage sprite;
  String name;

  Enemy(int health, int damage, int money, String spriteName, String name) {
    this.health = health;
    this.damage = damage;
    this.money = money;
    this.name = name;
    this.sprite = loadImage(spriteName);

    money = int(random(101));
    
    if(health == 0) {
      p.money = p.money + money;
    }
  }
  }

  void attack(Player target) {
    target.health -= this.damage;
  }
}
