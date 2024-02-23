class Item {
  float common = 1;
  float rare = 1.2;
  float epic = 1.5;
  float legendary = 2;
  
  ArrayList<Weapon> weapons;
  ArrayList<Armor> armors;
  
  Item () {
    weapons = new ArrayList<>();
    weaponL();
    
    armors = new ArrayList<>();
    armorL();
  }
  
  void armorL() {
    armors.add(new Armor("Basic Helmet", 10));
    armors.add(new Armor("Refined Helmet", 15));
    armors.add(new Armor("Dragon Helmet", 20));
    armors.add(new Armor("Basic Chestplate", 20));
    armors.add(new Armor("Refined Chestplate", 25));
    armors.add(new Armor("Dragon Chestplate", 30));
    armors.add(new Armor("Basic Trousers", 15));
    armors.add(new Armor("Refined Trousers", 20));
    armors.add(new Armor("Dragon Trousers", 25));
    armors.add(new Armor("Basic Boots", 10));
    armors.add(new Armor("Refined Boots", 15));
    armors.add(new Armor("Dragon Boots", 20));
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
