class Potion{
  String name;
  int hp, price;
  
  Potion(String name, int hp, int price) {
    this.name = name;
    this.hp = hp;
    this.price = price;
  }
  
  String getName() {
    return name;
  }
  
  int getHp() {
    return hp;
  }
  
  int getPrice() {
    return price;
  }
}
