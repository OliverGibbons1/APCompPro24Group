class Player{
  int x, y, health, money;
  ArrayList<Item> items;
  
  Player(){
    x = 310;
    y = 310;
    health = 10;
    items = new ArrayList<Item>();
  }
  
  void attack(Enemy target, int damage){
    target.health -= damage;
  }
}
