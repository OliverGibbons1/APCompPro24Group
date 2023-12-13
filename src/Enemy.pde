class Enemy{
  int health, damage;
  
  Enemy(int health, int damage){
    this.health = health;
    this.damage = damage;
  }
  
  void attack(Player target){
    target.health -= damage;
  }
}
