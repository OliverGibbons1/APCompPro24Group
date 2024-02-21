class Item {
  float common = 1;
  float rare = 1.2;
  float epic = 1.5;
  float legendary = 2;
  
  ArrayList<Weapon> weapons;
  
  Item () {
    weapons = new ArrayList<>();
    weaponL();
  }
  
  void items() {

    String[] armor = new String[11];
    armor[0] = "Basic Helmet";
    armor[1] = "Refined Helmet";
    armor[2] = "Dragon Helmet";
    armor[3] = "Basic Chestplate";
    armor[4] = "Refined Chestplate";
    armor[5] = "Dragon Chestplate";
    armor[6] = "Basic Trousers";
    armor[7] = "Refined Trousers";
    armor[8] = "Dragon Trousers";
    armor[9] = "Basic Boots";
    armor[10] = "Refined Boots";
    armor[11] = "Dragon Boots";

  }
  
  void weaponL() {
    weapons.add(new Weapon("Basic Sword", 10));
    weapons.add(new Weapon("Refined Sword", 15));
    weapons.add(new Weapon("Katana", 20));
    weapons.add(new Weapon("Long Sword", 25));
    weapons.add(new Weapon("Dragon Sword", 30));
    }
    
    int wpnDmg(String wpnName) {
      for (Weapon weapon : weapons) {
        if (weapon.getName().equals(wpnName)) {
          return weapon.getDmg();
        }
      }
      return -1;
    } 
  
  //future item transfer method
  void iT(Player p) {
  }
}
