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
    armors.add(new Armor("Basic Helmet", 10, 1));
    armors.add(new Armor("Refined Helmet", 15, 1));
    armors.add(new Armor("Dragoon Helmet", 20, 1));
    armors.add(new Armor("Basic Chestplate", 20, 2));
    armors.add(new Armor("Refined Chestplate", 25, 2));
    armors.add(new Armor("Dragoon Chestplate", 30, 2));
    armors.add(new Armor("Basic Trousers", 15, 3));
    armors.add(new Armor("Refined Trousers", 20, 3));
    armors.add(new Armor("Dragoon Trousers", 25, 3));
    armors.add(new Armor("Basic Boots", 10, 4));
    armors.add(new Armor("Refined Boots", 15, 4));
    armors.add(new Armor("Dragoon Boots", 20, 4));
  }

  void weaponL() {
    weapons.add(new Weapon("Basic Sword", 10));
    weapons.add(new Weapon("Refined Sword", 15));
    weapons.add(new Weapon("Katana", 20));
    weapons.add(new Weapon("Long Sword", 25));
    weapons.add(new Weapon("Dragoon Sword", 30));
  }

  void potionL() {
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
