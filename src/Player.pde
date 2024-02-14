class Player{
  int x, y, health, damage, money;
  String weapon, helmet, chestplate, trousers, boots;
  ArrayList<Shop> items;
  PImage sprite;
  
  Player(){
    this.x = x;
    this.y = y;
    this.health = health;
    this.money = money;
    this.damage = damage;
    this.weapon = weapon;
    items = new ArrayList<Shop>();
    this.sprite = loadImage("sprites/DemoPlayer.png");
  }
  
  void attack(Enemy target, int damage){
    target.health -= damage;
  }
  
  void attacked(Enemy target, int health) {
    target.damage -= health;
  }
  
  int getTotDmg(Item weapons) {
    return damage + weapons.getDmg();
  }
}
