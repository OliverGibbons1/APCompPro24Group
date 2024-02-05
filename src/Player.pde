class Player{
  int x, y, health, money;
  ArrayList<Shop> items;
  
  Player(){
    this.x = x;
    this.y = y;
    this.health = health;
    this.money = money;
    items = new ArrayList<Shop>();
  }
  
  void attack(Enemy target, int damage){
    target.health -= damage;
  }
}
