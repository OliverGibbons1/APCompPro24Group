class Item {
  float common = 1;
  float rare = 1.2;
  float epic = 1.5;
  float legendary = 2;

  ArrayList<Weapon> weapons;
  ArrayList<Armor> armors;
  ArrayList<Potion> potions;

  Item () {
    weapons = new ArrayList<>();
    weaponL();

    armors = new ArrayList<>();
    armorL();
    
    potions = new ArrayList<>();
    potionL();
  }

  void armorL() {
    armors.add(new Armor("Basic Helmet", 10, 1, 15));
    armors.add(new Armor("Refined Helmet", 15, 1, 15));
    armors.add(new Armor("Dragoon Helmet", 20, 1, 15));
    armors.add(new Armor("Basic Chestplate", 20, 2, 15));
    armors.add(new Armor("Refined Chestplate", 25, 2, 15));
    armors.add(new Armor("Dragoon Chestplate", 30, 2, 15));
    armors.add(new Armor("Basic Trousers", 15, 3, 15));
    armors.add(new Armor("Refined Trousers", 20, 3, 15));
    armors.add(new Armor("Dragoon Trousers", 25, 3, 15));
    armors.add(new Armor("Basic Boots", 10, 4, 15));
    armors.add(new Armor("Refined Boots", 15, 4, 15));
    armors.add(new Armor("Dragoon Boots", 20, 4, 15));
  }

  void weaponL() {
    weapons.add(new Weapon("Basic Sword", 10, 15));
    weapons.add(new Weapon("Refined Sword", 15, 15));
    weapons.add(new Weapon("Katana", 20, 15));
    weapons.add(new Weapon("Long Sword", 25, 15));
    weapons.add(new Weapon("Dragoon Sword", 30, 15));
  }

  void potionL() {
    potions.add(new Potion("Small Health Potion", 1));
    potions.add(new Potion("Medium Health Potion", 2));
    potions.add(new Potion("Large Potion", 3));
  }

  int wpnDmg(String wpnName) {
    for (Weapon weapon : weapons) {
      if (weapon.getName().equals(wpnName)) {
        return weapon.getDmg();
      }
    }
    return -1;
  }

  int armorHp(String armorName) {
    for (Armor armor : armors) {
      if (armor.getName().equals(armorName)) {
        return armor.getHp();
      }
    }
    return -1;
  }

  int armorSpot(String armorName) {
    for (Armor armor : armors) {
      if (armor.getName().equals(armorName)) {
        return armor.getSpot();
      }
    }
    return -1;
  }
}
