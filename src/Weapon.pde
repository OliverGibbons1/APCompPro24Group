class Weapon{
  String name;
  int dmg, price;
  
  Weapon(String name, int dmg, int price) {
    this.name = name;
    this.dmg = dmg;
    this.price = price;
  }
  
  String getName() {
    return name;
  }
  
  int getDmg() {
    return dmg;
 }
 
 int getPrice() {
   return price;
 }
}
