//Completed by Oliver Gibbons
class Shop {
  Player player;
  Item it;
  String consoleMessage;
  int spot;
  String weapon, potion, helmet, chestplate, trousers, boots;
  Button [] selectButton = new Button[4];
  Button [] weaponButton = new Button[5];
  Button [] potionButton = new Button[3];
  Button [] armorButton;
  boolean quit;
  int screenWidth = 640;
  int screenHeight = 640;
  boolean weaponDisplay, armorDisplay, potionDisplay = false;
  int price;
  boolean purchased = false;
  int center = screenWidth / 2;
  int qLeft = screenWidth / 4;
  int qRight = qLeft * 3;

  boolean[] WBPressed = new boolean[weaponButton.length];
  boolean[] ABPressed = new boolean[12];
  boolean[] PBPressed = new boolean[potionButton.length];

  PImage weaponA, weaponB, weaponC, weaponD, weaponE;
  PImage smallPotionImg, mediumPotionImg, largePotionImg;
  PImage basicHelmetImg, basicChestplateImg, basicTrousersImg, basicBootsImg;
  PImage refinedHelmetImg, refinedChestplateImg, refinedTrousersImg, refinedBootsImg;
  PImage dragoonHelmetImg, dragoonChestplateImg, dragoonTrousersImg, dragoonBootsImg;

  int pm = (screenWidth / 2) - 150;
  int pma = (screenWidth / 2) + 10;
  int pmc = (screenWidth / 2) - 75;

  int centeredBoxWidth = 500;
  int centeredBoxHeight = 375;
  int marginX = ((screenWidth - centeredBoxWidth) / 2) - 5;
  int marginY = ((screenHeight - centeredBoxHeight) / 2) - 20;

  int numRows = 3;
  int numCols = 4;
  int innerBoxWidth = (centeredBoxWidth - 2 * 10) / numCols;
  int innerBoxHeight = (centeredBoxHeight - 2 * 10) / numRows;

  Shop() {
    //weaponE = dragoon sword
    weaponA = loadImage("sprites/ItemSprites/BasicSword.png");
    weaponB = loadImage("sprites/ItemSprites/RefinedSword.png");
    weaponC = loadImage("sprites/ItemSprites/Katana.png");
    weaponD = loadImage("sprites/ItemSprites/LongSword.png");
    weaponE = loadImage("sprites/ItemSprites/DragoonSword.png");
    smallPotionImg = loadImage("sprites/ItemSprites/HealthFlask.png");
    mediumPotionImg = loadImage("sprites/ItemSprites/HealthFlask.png");
    largePotionImg = loadImage("sprites/ItemSprites/HealthFlask.png");

    basicHelmetImg = loadImage("sprites/ItemSprites/BasicHelmet.png");
    basicChestplateImg = loadImage("sprites/ItemSprites/BasicChestplate.png");
    basicTrousersImg = loadImage("sprites/ItemSprites/BasicTrousers.png");
    basicBootsImg = loadImage("sprites/ItemSprites/BasicBoots.png");

    refinedHelmetImg = loadImage("sprites/ItemSprites/RefinedHelmet.png");
    refinedChestplateImg = loadImage("sprites/ItemSprites/RefinedChestplate.png");
    refinedTrousersImg = loadImage("sprites/ItemSprites/RefinedTrousers.png");
    refinedBootsImg = loadImage("sprites/ItemSprites/RefinedBoots.png");

    dragoonHelmetImg = loadImage("sprites/ItemSprites/DragoonHelmet.png");
    dragoonChestplateImg = loadImage("sprites/ItemSprites/DragoonChestplate.png");
    dragoonTrousersImg = loadImage("sprites/ItemSprites/DragoonTrousers.png");
    dragoonBootsImg = loadImage("sprites/ItemSprites/DragoonBoots.png");

    weaponA.resize(150, 100);
    weaponB.resize(150, 100);
    weaponC.resize(150, 100);
    weaponD.resize(150, 100);
    weaponE.resize(150, 100);
    smallPotionImg.resize(50, 50);
    mediumPotionImg.resize(75, 75);
    largePotionImg.resize(100, 100);

    basicHelmetImg.resize(innerBoxWidth, innerBoxHeight);
    basicChestplateImg.resize(innerBoxWidth, innerBoxHeight);
    basicTrousersImg.resize(innerBoxWidth, innerBoxHeight);
    basicBootsImg.resize(innerBoxWidth, innerBoxHeight);

    refinedHelmetImg.resize(innerBoxWidth, innerBoxHeight);
    refinedChestplateImg.resize(innerBoxWidth, innerBoxHeight);
    refinedTrousersImg.resize(innerBoxWidth, innerBoxHeight);
    refinedBootsImg.resize(innerBoxWidth, innerBoxHeight);

    dragoonHelmetImg.resize(innerBoxWidth, innerBoxHeight);
    dragoonChestplateImg.resize(innerBoxWidth, innerBoxHeight);
    dragoonTrousersImg.resize(innerBoxWidth, innerBoxHeight);
    dragoonBootsImg.resize(innerBoxWidth, innerBoxHeight);

    this.player = p;
    it = new Item();
    this.quit = false;

    //SELECTBUTTON ARRAY -------------------------------------

    selectButton[0] = new Button(qLeft - 50, 495, 100, 40, 's');
    selectButton[1] = new Button(qRight - 50, 495, 100, 40, 's');
    selectButton[2] = new Button(center - 50, 495, 100, 40, 's');
    selectButton[3] = new Button (qRight - 30, 55, 100, 40, 's');

    //ARMORBUTTON ARRAY --------------------------------------
    armorButton = new Button[12];



    int index = 0;
    for (int row = 0; row < numRows; row++) {
      for (int col = 0; col < numCols; col++) {
        int x = marginX + col * (innerBoxWidth + 10);
        int y = marginY + row * (innerBoxHeight + 10);
        armorButton[index] = new Button(x, y, innerBoxWidth, innerBoxHeight, 'a');
        index++;
      }
    }

    //WEAPONBUTTON ARRAY -----------------------------------------


    // First row boxes
    weaponButton[0] = new Button(pm, 130, 150, 100, 'w');
    weaponButton[1] = new Button(pma, 130, 150, 100, 'w');

    // Coordinates for the second row of boxes
    weaponButton[2] = new Button(pm, 240, 150, 100, 'w');
    weaponButton[3] = new Button(pma, 240, 150, 100, 'w');

    // Coordinates for the centered box
    weaponButton[4] = new Button(pmc, 350, 150, 100, 'w');

    //POTIONBUTTON ARRAY -------------------------------------------
    potionButton[0] = new Button(pm, 200, 150, 100, 'p');
    potionButton[1] = new Button(pma, 200, 150, 100, 'p');

    // Coordinates for the centered box
    potionButton[2] = new Button(pmc, 310, 150, 100, 'p');

    //Check for Weapon, armor, and potion button pressed
    for (int i = 0; i < WBPressed.length; i++) {
      WBPressed[i] = false;
    }
    for (int i = 0; i < ABPressed.length; i++) {
      ABPressed[i] = false;
    }
    for (int i = 0; i < PBPressed.length; i++) {
      PBPressed[i] = false;
    }
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
    text("Exit", qRight + 18, 82);

    if (selectButton[0].pressed()) {
      weaponDisplay = true;
      armorDisplay = false;
      potionDisplay = false;
    } else if (selectButton[1].pressed()) {
      armorDisplay = true;
      weaponDisplay = false;
      potionDisplay = false;
    } else if (selectButton[2].pressed()) {
      potionDisplay = true;
      armorDisplay = false;
      weaponDisplay = false;
    } else if (selectButton[3].pressed()) {
      quit = true;
    }

    if (weaponDisplay) {
      weaponDisplay();
    }
    if (armorDisplay) {
      armorDisplay();
    }
    if (potionDisplay) {
      potionDisplay();
    }
  }


  void weaponDisplay() {
    boolean firstRun = true;
    if (firstRun) {
      consoleMessage = "Welcome to the Weapons Shop! Buy what you can!";
      firstRun = false;
    }
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
    text("Exit", qRight + 18, 82);

    for (int i = 0; i < weaponButton.length; i++) {
      if (weaponButton[i].pressed() && weaponButton[i].type == 'w') {
      }
    }

    for (int i = 0; i < weaponButton.length; i++) {
      weaponButton[i].display();
      image(weaponA, pm, 130);
      image(weaponB, pma, 130);
      image(weaponC, pm, 240);
      image(weaponD, pma, 240);
      image(weaponE, pmc, 350);
      if (weaponButton[i].pressed() && !WBPressed[i]) {  // Check if the button is pressed and it's not already marked as pressed
        if (i == 0) {
          weapon = "Basic Sword";
          consoleMessage = "Bought 'Basic Sword'";
        } else if (i == 1) {
          weapon = "Refined Sword";
          consoleMessage = "Bought 'Refined Sword'";
        } else if (i == 2) {
          weapon = "Katana";
          consoleMessage = "Bought 'Katana'";
        } else if (i == 3) {
          weapon = "Long Sword";
          consoleMessage = "Bought 'Long Sword'";
        } else if (i == 4) {
          weapon = "Dragoon Sword";
          consoleMessage = "Bought 'Dragoon Sword'";
        }
        price = it.wpnPrice(weapon);

        if (p.money >= price) {
          p.money -= price;
          p.weapon = weapon;
          println("WB true");
        }

        p.money -= price;
        p.weapon = weapon;
        consoleMessage = "Bought " + weapon;
        println(consoleMessage);
        WBPressed[i] = true; // Mark the button as pressed
      } else if (!weaponButton[i].pressed()) {
        WBPressed[i] = false; // Reset the pressed state when the button is released
      }
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
    text("Exit", qRight + 18, 82);

    for (int i = 0; i < armorButton.length; i++) {
      armorButton[i].display();

      image(basicHelmetImg, armorButton[0].x, armorButton[0].y);
      image(basicChestplateImg, armorButton[1].x, armorButton[1].y);
      image(basicTrousersImg, armorButton[2].x, armorButton[2].y);
      image(basicBootsImg, armorButton[3].x, armorButton[3].y);

      image(refinedHelmetImg, armorButton[4].x, armorButton[4].y);
      image(refinedChestplateImg, armorButton[5].x, armorButton[5].y);
      image(refinedTrousersImg, armorButton[6].x, armorButton[6].y);
      image(refinedBootsImg, armorButton[7].x, armorButton[7].y);

      image(dragoonHelmetImg, armorButton[8].x, armorButton[8].y);
      image(dragoonChestplateImg, armorButton[9].x, armorButton[9].y);
      image(dragoonTrousersImg, armorButton[10].x, armorButton[10].y);
      image(dragoonBootsImg, armorButton[11].x, armorButton[11].y);

      if (armorButton[i].pressed() && !ABPressed[i]) {
        if (i == 0) {
          helmet = "Basic Helmet";
          price = it.armorPrice(helmet);
          spot = 1;
        } else if (i == 1) {
          chestplate = "Basic Chestplate";
          price = it.armorPrice(chestplate);
          spot = 2;
        } else if (i == 2) {
          trousers = "Basic Trousers";
          price = it.armorPrice(trousers);
          spot = 3;
        } else if (i == 3) {
          boots = "Basic Boots";
          price = it.armorPrice(boots);
          spot = 4;
        } else if (i == 4) {
          helmet = "Refined Helmet";
          price = it.armorPrice(helmet);
          spot = 1;
        } else if (i == 5) {
          chestplate = "Refined Chestplate";
          price = it.armorPrice(chestplate);
          spot = 2;
        } else if (i == 6) {
          trousers = "Refined Trousers";
          price = it.armorPrice(trousers);
          spot = 3;
        } else if (i == 7) {
          boots = "Refined Boots";
          price = it.armorPrice(boots);
          spot = 4;
        } else if (i == 8) {
          helmet = "Dragoon Helmet";
          price = it.armorPrice(helmet);
          spot = 1;
        } else if (i == 9) {
          chestplate = "Dragoon Chestplate";
          price = it.armorPrice(chestplate);
          spot = 2;
        } else if (i == 10) {
          trousers = "Dragoon Trousers";
          price = it.armorPrice(trousers);
          spot = 3;
        } else if (i == 11) {
          boots = "Dragoon Boots";
          price = it.armorPrice(boots);
          spot = 4;
        }


        if (p.money >= price) {
          if (spot == 1) {
            p.money -= price;
            p.helmet = helmet;
            println("Purchased " + p.helmet);
          } else if (spot == 2) {
            p.money -= price;
            p.chestplate = chestplate;
            println("Purchased " + p.chestplate);
          } else if (spot == 3) {
            p.money -= price;
            p.trousers = trousers;
            println("Purchased " + p.trousers);
          } else if (spot == 4) {
            p.money -= price;
            p.boots = boots;
            println("Purchased " + p.boots);
          }

          if (spot == 1) {
            p.helmet = helmet;
            println(p.helmet);
            println(p.maxHealth);
          } else if (spot == 2) {
            p.chestplate = chestplate;
            println(p.chestplate);
            println(p.maxHealth);
          } else if (spot == 3) {
            p.trousers = trousers;
            println(p.trousers);
            println(p.maxHealth);
          } else if (spot == 4) {
            p.boots = boots;
            println(p.boots);
            println(p.maxHealth);
          }
          ABPressed[i] = true; // Mark the button as pressed
        } else {
          println("Not enough money!");
        }
      } else if (!armorButton[i].pressed()) {
        ABPressed[i] = false; // Reset the pressed state when the button is released
      }
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
    text("Exit", qRight + 18, 82);

    for (int i = 0; i < potionButton.length; i++) {
      potionButton[i].display();
      image(smallPotionImg, pm + 50, 200 + 25);
      image(mediumPotionImg, pma + 25, 200 + 10);
      image(largePotionImg, pmc + 10, 310);
      // Check if the button is pressed and it's not already marked as pressed
      if (potionButton[i].pressed() && !PBPressed[i]) {
        if (i == 0) {
          potion = "Small Potion";
        } else if (i == 1) {
          potion = "Medium Potion";
        } else if (i ==2) {
          potion = "Large Potion";
        }
        price = it.potionPrice(potion);
        if (p.money >= price) {
          p.money -= price;
          p.health += it.potionHp(potion);
        }
        PBPressed[i] = true; // Mark the button as pressed
      } else if (!potionButton[i].pressed()) {
        PBPressed[i] = false; // Reset the pressed state when the button is released
      }
    }
  }
}
