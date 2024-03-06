//Completed by Oliver Gibbons
class Shop {
  Player player;
  Item i;
  String consoleMessage;
  String weapon = "Basic Sword";
  Button [] selectButton = new Button[3];
  Button [] weaponButton = new Button[5];
  Button [] potionButton = new Button[3];
  Button [] armorButton;
  boolean playerTurn = true;
  int screenWidth = 640;
  int screenHeight = 640;
  boolean weaponDisplay, armorDisplay, potionDisplay = false;
  int price;
  boolean purchased = false;
  int center = screenWidth / 2;
  int qLeft = screenWidth / 4;
  int qRight = qLeft * 3;


  Shop() {
    this.player = p;
    i = new Item();

    String[] weaponNames = {"Basic Sword", "Refined Sword", "Katana"};
    int numWpns = weaponNames.length;

    //SELECTBUTTON ARRAY -------------------------------------

    selectButton[0] = new Button(qLeft - 50, 495, 100, 40);
    selectButton[1] = new Button(qRight - 50, 495, 100, 40);
    selectButton[2] = new Button(center - 50, 495, 100, 40);

    //ARMORBUTTON ARRAY --------------------------------------
    armorButton = new Button[12];

    int centeredBoxWidth = 500;
    int centeredBoxHeight = 375;
    int marginX = ((screenWidth - centeredBoxWidth) / 2) + 6;
    int marginY = ((screenHeight - centeredBoxHeight) / 2) - 63;

    int numRows = 3;
    int numCols = 4;
    int innerBoxWidth = (centeredBoxWidth - 2 * 10) / numCols;
    int innerBoxHeight = (centeredBoxHeight - 2 * 10) / numRows;

    int index = 0;

    for (int row = 0; row < numRows; row++) {
      for (int col = 0; col < numCols; col++) {
        int x = marginX + 50 + col * (innerBoxWidth + 10);
        int y = marginY + 100 + row * (innerBoxHeight + 10);
        armorButton[index] = new Button(x, y, innerBoxWidth, innerBoxHeight);
        index++;
      }
    }

    //WEAPONBUTTON ARRAY -----------------------------------------
    int pm = (screenWidth / 2) - 150;
    int pma = (screenWidth / 2) + 10;
    int pmc = (screenWidth / 2) - 75;

    // First row boxes
    weaponButton[0] = new Button(pm, 130, 150, 100);
    weaponButton[1] = new Button(pma, 130, 150, 100);

    // Coordinates for the second row of boxes
    weaponButton[2] = new Button(pm, 240, 150, 100);
    weaponButton[3] = new Button(pma, 240, 150, 100);

    // Coordinates for the centered box
    weaponButton[4] = new Button(pmc, 350, 150, 100);

    //POTIONBUTTON ARRAY -------------------------------------------
    potionButton[0] = new Button(pm, 200, 150, 100);
    potionButton[1] = new Button(pma, 200, 150, 100);

    // Coordinates for the centered box
    potionButton[2] = new Button(pmc, 310, 150, 100);
  }

  void display() {
    consoleMessage = "Welcome to the shop! Buy what you can!";
    fill(155);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    fill(0);
    text("Gold: " + p.money, center, 83);
    stroke(255);
    fill(0);
    text(consoleMessage, center, 575);

    for (int i = 0; i < selectButton.length; i ++) {
      selectButton[i].display();
    }
    fill(255);
    textAlign(CENTER);
    text("Weapon", qLeft, 520);
    text("Armor", qRight, 520);
    text("Potions", center, 520);

    if (selectButton[0].pressed()) {
      weaponDisplay = true;
    }
    if (selectButton[1].pressed()) {
      armorDisplay = true;
    }
    if (selectButton[2].pressed()) {
      potionDisplay = true;
    }

    if (weaponDisplay) {
      armorDisplay = false;
      potionDisplay = false;
      weaponDisplay();
    }
    if (armorDisplay) {
      weaponDisplay = false;
      potionDisplay = false;
      armorDisplay();
    }
    if (potionDisplay) {
      armorDisplay = false;
      weaponDisplay = false;
      potionDisplay();
    }
  }


  void weaponDisplay() {
    consoleMessage = "Welcome to the Weapons Shop! Buy what you can!";
    fill(155);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    fill(0);
    text("Gold: " + p.money, center, 83);
    stroke(255);
    fill(0);
    text(consoleMessage, center, 575);
    for (int i = 0; i < selectButton.length; i ++) {
      selectButton[i].display();
    }
    fill(255);
    textAlign(CENTER);
    text("Weapon", qLeft, 520);
    text("Armor", qRight, 520);
    text("Potions", center, 520);

    for (int i = 0; i < numWpns; i++) {
      if (weaponButton[i].pressed()) {
        weapon = weaponNames[i];
        price = i.wpnPrice(weapon);
        break; // exit the loop after finding the pressed button
      }
    }

    for (int i = 0; i < weaponButton.length; i++) {
      weaponButton[i].display();
      if (weaponButton[i].pressed()) {
        println("WB true");
        //in here, check if a player has enough gold to purchase and set a boolean that alters damage/health done.
      }
    }

    if (selectButton[1].pressed()) {
      armorDisplay = true;
    } else if (selectButton[2].pressed()) {
      potionDisplay = true;
    }
    if (armorDisplay) {
      weaponDisplay = false;
      armorDisplay();
    } else if (potionDisplay) {
      weaponDisplay = false;
      potionDisplay();
    }
  }

  void armorDisplay() {
    consoleMessage = "Welcome to the Armor Shop! Buy what you can!";
    fill(155);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    fill(0);
    text("Gold: " + p.money, center, 83);
    stroke(255);
    fill(0);
    text(consoleMessage, center, 575);
    for (int i = 0; i < selectButton.length; i ++) {
      selectButton[i].display();
    }
    fill(255);
    textAlign(CENTER);
    text("Weapon", qLeft, 520);
    text("Armor", qRight, 520);
    text("Potions", center, 520);

    boolean corner = false;
    for (int i = 0; i < armorButton.length; i++) {
      rectMode(CENTER);
      armorButton[i].display();
      corner = true;

      if (armorButton[i].pressed()) {
        println("AB true");
        //in here, check if a player has enough gold to purchase and set a boolean that alters damage/health done.
      }
    }
    if (corner) {
      rectMode(CORNER);
    }

    if (selectButton[0].pressed()) {
      weaponDisplay = true;
    } else if (selectButton[2].pressed()) {
      potionDisplay = true;
    }
    if (weaponDisplay) {
      armorDisplay = false;
      weaponDisplay();
    } else if (potionDisplay) {
      armorDisplay = false;
      potionDisplay();
    }
  }

  void potionDisplay() {
    consoleMessage = "Welcome to the Potion Shop! Buy what you can!";
    fill(155);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    fill(0);
    text("Gold: " + p.money, center, 83);
    stroke(255);
    fill(0);
    text(consoleMessage, center, 575);
    for (int i = 0; i < selectButton.length; i ++) {
      selectButton[i].display();
    }
    fill(255);
    textAlign(CENTER);
    text("Weapon", qLeft, 520);
    text("Armor", qRight, 520);
    text("Potions", center, 520);

    for (int i = 0; i < potionButton.length; i++) {
      potionButton[i].display();
      if (potionButton[i].pressed()) {
        println("PB true");
        //in here, check if a player has enough gold to purchase and set a boolean that alters damage/health done.
      }
    }

    if (selectButton[1].pressed()) {
      armorDisplay = true;
    } else if (selectButton[0].pressed()) {
      weaponDisplay = true;
    }
    if (armorDisplay) {
      potionDisplay = false;
      armorDisplay();
    } else if (weaponDisplay) {
      potionDisplay = false;
      weaponDisplay();
    }
  }
}
