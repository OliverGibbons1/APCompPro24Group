class Item{
  int cost;
  int damage;
  
  Item(int cost, int damage){
    this.cost = cost;
    this.damage = damage;
  }
  
  int attack(){
    return damage;
  }
}
