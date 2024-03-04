class Armor{
  String name;
  int hp, spot, price;
  
  Armor(String name, int hp, int spot, int price){
    this.name = name;
    this.hp = hp;
    this.spot = spot;
    this.price = price;
  }
  
  String getName() {
    return name;
  }
  
  int getHp() {
    return hp;
  }
  
  int getSpot() {
    return spot;
  }
  
  int getPrice() {
    return price;
  }
}
