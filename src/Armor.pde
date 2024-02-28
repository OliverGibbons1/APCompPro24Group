class Armor{
  String name;
  int hp, spot;
  
  Armor(String name, int hp, int spot){
    this.name = name;
    this.hp = hp;
    this.spot = spot;
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
}
