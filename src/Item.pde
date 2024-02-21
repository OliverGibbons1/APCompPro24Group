class Item {
  float common = 1;
  float rare = 1.2;
  float epic = 1.5;
  float legendary = 2;

  String name;
  int dmg;

  Item (String name, int damage) {
    this.name = name;
    this.dmg = dmg;
  }

  String getName() {
    return name;
  }

  int getDmg() {
    return dmg;
  }

  void items() {
    ArrayList<Item> weapons = new ArrayList<Item>();
    String[] armor = new String[11];

    weapons.add(new Item("Basic Sword", 10));
    weapons.add(new Item("Refined Sword", 15));
    weapons.add(new Item("Katana", 20));
    weapons.add(new Item("Long Sword", 25));
    weapons.add(new Item("Dragon Sword", 30));

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
}
