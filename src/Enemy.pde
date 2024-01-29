class Enemy{
  int health, damage, money;
  PImage sprite;
  String name;
  
  Enemy(int health, int damage){
    this.health = health;
    this.damage = damage;
  }
  
  void attack(Player target){
    target.health -= damage;
  }
}
