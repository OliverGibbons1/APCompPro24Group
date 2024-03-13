// Completed by all of us
// Player Sprite done by Jack Wakefield
class Player {
  int x, y, health, damage, money, maxHealth;
  int moveW = 0;
  String weapon, armor, helmet, chestplate, trousers, boots;
  ArrayList<Shop> items;
  PImage sprite;
  Item i;

  Player() {
    i = new Item();
    this.x = x;
    this.y = y;
    this.health = health;
    this.maxHealth = maxHealth;
    this.money = money;
    this.damage = damage;
    this.weapon = weapon;
    //items = new ArrayList<Shop>();
    this.sprite = loadImage("sprites/BlueGuy.png");
    this.sprite.resize(64, 64);
    
    weapon  = "Starter Sword";
    int weaponDmg = i.wpnDmg(weapon);

    if (weaponDmg != -1) {
      damage += weaponDmg;
    }

    int helmetHp = i.armorHp(helmet);
    int helmetSpot = i.armorSpot(helmet);


    if (helmetHp != -1 && helmetSpot == 1) {
      maxHealth += helmetHp;
    }

    int chestHp = i.armorHp(chestplate);
    int chestSpot = i.armorSpot(chestplate);

    if (chestHp != -1 && chestSpot == 2) {
      maxHealth += chestHp;
    }

    int pantsHp = i.armorHp(trousers);
    int pantsSpot = i.armorSpot(trousers);

    if (pantsHp != -1 && pantsSpot == 3) {
      maxHealth += pantsHp;
    }

    int bootsHp = i.armorHp(boots);
    int bootsSpot = i.armorSpot(boots);

    if (bootsHp != -1 && bootsSpot == 4) {
      maxHealth += bootsHp;
    }
  }

  void attack(Enemy target, int damage) {
    target.health -= damage;
  }

  void attacked(Enemy target, int health) {
    target.damage -= health;
  }

  void display() {
    image(this.sprite, x, y);
  }

  void move(Boolean[][] MapBound) {
    int preX=x;
    int preY=y;
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
      if (MapBound[int(float(y)%64)][int(float(x)%64)]) {
        x=preX;
        y=preY;
      }
      moveW+=1;
    }
    if (!keyPressed || moveW>=30) {
      moveW = 0;
    }
  }
}
