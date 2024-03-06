//Completed by Oliver Gibbons
class Shop {
  Player player;
  Item i;
  String consoleMessage;
  Button [] selectButton = new Button[3];
  Button [] weaponButton = new Button[5];
  Button [] armorButton;
  boolean playerTurn = true;
<<<<<<< HEAD
  int screenWidth = 640;
  int screenHeight = 640;
  boolean weaponDisplay, armorDisplay = false;
=======
  int wPrice, aPrice;
  boolean purchased = false;
>>>>>>> 37fe7d2a548daed1ae1a48988abcf5ecee9daff9

  Shop() {
    this.player = p;
    i = new Item();

    //SELECTBUTTON ARRAY -------------------------------------
    int center = screenWidth / 2;
    
    selectButton[0] = new Button(175, 495, 100, 40);
    selectButton[1] = new Button(375, 495, 100, 40);
    //selectButton[3] = new Button(center, 495, 100, 40);

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
    text("Gold: " + p.money, 290, 83);
    stroke(255);
    fill(0);
    text(consoleMessage, 75, 575);
    fill(255);
    selectButton[0].display();
    selectButton[1].display();
    text("Weapon", 200, 510);
    text("Armor", 400, 510);

    if (selectButton[0].pressed()) {
      weaponDisplay = true;
    } else if (selectButton[1].pressed()) {
      armorDisplay = true;
    }
    
    if(weaponDisplay) {
      armorDisplay = false;
    weaponDisplay();
    } 
    if (armorDisplay) {
    weaponDisplay = false;
    armorDisplay();
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
    text("Gold: " + p.money, 290, 83);
    stroke(255);
    fill(0);
    text(consoleMessage, 75, 575);
    fill(255);
    selectButton[0].display();
    selectButton[1].display();
    text("Weapon", 200, 510);
    text("Armor", 400, 510);
    
    

    for (int i = 0; i < weaponButton.length; i++) {
      weaponButton[i].display();
      if (weaponButton[i].pressed()) {
        println("WB true");
        //in here, check if a player has enough gold to purchase and set a boolean that alters damage/health done.
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
    text("Gold: " + p.money, 290, 83);
    stroke(255);
    fill(0);
    text(consoleMessage, 75, 575);
    fill(255);
    selectButton[0].display();
    selectButton[1].display();
    text("Weapon", 200, 525);
    text("Armor", 400, 525);

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
  }
}
