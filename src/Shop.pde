class Shop {
<<<<<<< Updated upstream
  Player player;
  String dialogue, consoleMessage;
  Button [] selectButton = new Button[2];
  Button [] weaponButton = new Button[6];
  Button [] armorButton = new Button[12];
  boolean playerTurn = true;

  Shop() {
    consoleMessage = this.dialogue;
    selectButton[0] = new Button (175, 495, 100, 40);
    selectButton[1] = new Button (375, 495, 100, 40);
    armorButton[0] = new Button (126, 425, 120, 118);
    armorButton[1] = new Button (256, 425, 120, 118);
    armorButton[2] = new Button (386, 425, 120, 118);
    armorButton[3] = new Button (516, 425, 120, 118);
  }

  void customer() {
    dialogue = "Welcome to the shop! Buy what you can!";
    if (selectButton[0].pressed()) {
=======
<<<<<<< HEAD
  Player p;
  String consoleMessage;
  Button weaponButton, armorButton;
  boolean playerTurn = true;

  Shop() {
    weaponButton = new Button(175, 480, 100, 40);
    armorButton = new Button(375, 480, 100, 40);
    p = new Player();
  }

  void customer() {
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
    //  text("Gold: " + this.player.money, 290, 83);
    stroke(255);
    fill(0);
    text(consoleMessage, 75, 575);
    fill(255);
    weaponButton.display();
    armorButton.display();
    text("Weapon", 200, 510);
    text("Armor", 400, 510);


    if (weaponButton.pressed()) {
=======
  Player player;
  String dialogue, consoleMessage;
  Button [] selectButton = new Button[2];
  Button [] weaponButton = new Button[6];
  Button [] armorButton = new Button[12];
  boolean playerTurn = true;

  Shop() {
    consoleMessage = this.dialogue;
    selectButton[0] = new Button (175, 495, 100, 40);
    selectButton[1] = new Button (375, 495, 100, 40);
    armorButton[0] = new Button (126, 425, 120, 118);
    armorButton[1] = new Button (256, 425, 120, 118);
    armorButton[2] = new Button (386, 425, 120, 118);
    armorButton[3] = new Button (516, 425, 120, 118);
  }

  void customer() {
    dialogue = "Welcome to the shop! Buy what you can!";
    if (selectButton[0].pressed()) {
>>>>>>> cc037ea3f81397e1e5b66f362f2c7f64aaabbaf0
>>>>>>> Stashed changes
      weaponDisplay();
    } else if (selectButton[1].pressed()) {
      armorDisplay();
    }
  }
<<<<<<< HEAD
=======

  void display() {
    fill(155);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    fill(0);
    text("Gold: " + player.money, 290, 83);
    stroke(255);
    fill(0);
    text(consoleMessage, 75, 575);
    fill(255);
    selectButton[0].display();
    selectButton[1].display();
    text("Weapon", 200, 510);
    text("Armor", 400, 510);
  }

<<<<<<< Updated upstream
=======
>>>>>>> cc037ea3f81397e1e5b66f362f2c7f64aaabbaf0
>>>>>>> Stashed changes
  void weaponDisplay() {
    consoleMessage = "Welcome to the shop! Buy what you can!";
    fill(155);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    fill(0);
    //   text("Gold: " + player.money, 290, 83);
    stroke(255);
    fill(0);
    text(consoleMessage, 75, 575);
    fill(255);
    selectButton[0].display();
    selectButton[1].display();
    text("Weapon", 200, 510);
    text("Armor", 400, 510);
<<<<<<< Updated upstream
    //for(int i = 0; i < weaponButton.length; i++){
    //  weaponButton[i].display();
    //}
  }
  void armorDisplay() {
=======
<<<<<<< HEAD

    int pm= (640 / 2) - 150;
    int pma = (640 / 2) + 10;
    // First row boxes
    rect(pm, 130, 150, 100);
    rect(pma, 130, 150, 100);

    // Coordinates for the second row of boxes
    rect(pm, 240, 150, 100);
    rect(pma, 240, 150, 100);
    int pmc= (640 / 2) - 75;
    // Coordinates for the centered box
    rect(pmc, 350, 150, 100);
  }
  void armorDisplay() {
    consoleMessage = "Welcome to the shop! Buy what you can!";
=======
    //for(int i = 0; i < weaponButton.length; i++){
    //  weaponButton[i].display();
    //}
  }
  void armorDisplay() {
>>>>>>> cc037ea3f81397e1e5b66f362f2c7f64aaabbaf0
>>>>>>> Stashed changes
    fill(155);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    fill(0);
<<<<<<< Updated upstream
    //    text("Gold: " + player.money, 290, 83);
=======
<<<<<<< HEAD
    //   text("Gold: " + player.money, 290, 83);
=======
    //    text("Gold: " + player.money, 290, 83);
>>>>>>> cc037ea3f81397e1e5b66f362f2c7f64aaabbaf0
>>>>>>> Stashed changes
    stroke(255);
    fill(0);
    //    text(consoleMessage, 75, 575);
    fill(255);
    selectButton[0].display();
    selectButton[1].display();
    text("Weapon", 200, 525);
    text("Armor", 400, 525);
    //for(int i = 0; i < armorButton.length; i++){
    //  armorButton[i].display();
    //}
    
    // armorButton[0].display();

    int screenWidth = 640;
    int screenHeight = 640;

<<<<<<< Updated upstream
=======
<<<<<<< HEAD
    int centeredBoxSize = 440;
    int marginX = (screenWidth - centeredBoxSize) / 2;
    int marginY = (screenHeight - centeredBoxSize) / 2;

    int numRows = 3;
    int numCols = 4;
    int innerBoxWidth = (centeredBoxSize - 2 * 10) / numCols; // Subtract 10 pixels for left and right margins
    int innerBoxHeight = (centeredBoxSize - 2 * 10) / numRows; // Subtract 10 pixels for top and bottom margins

    for (int row = 0; row < numRows; row++) {
      for (int col = 0; col < numCols; col++) {
        int x = marginX + 10 + col * (innerBoxWidth + 10); // Add 10 pixels for left margin
        int y = marginY + 10 + row * (innerBoxHeight + 10); // Add 10 pixels for top margin
        rect(x, y, innerBoxWidth, innerBoxHeight);
      }
=======
>>>>>>> Stashed changes
    int centeredBoxWidth = 500;
    int centeredBoxHeight = 375;
    int marginX = ((screenWidth - centeredBoxWidth) / 2) + 6;
    int marginY = ((screenHeight - centeredBoxHeight) / 2) - 63;

    int numRows = 3;
    int numCols = 4;
    int innerBoxWidth = (centeredBoxWidth - 2 * 10) / numCols; // Subtract 10 pixels for left and right margins
    int innerBoxHeight = (centeredBoxHeight - 2 * 10) / numRows; // Subtract 10 pixels for top and bottom margins

    //for (int row = 0; row < numRows; row++) {
    //  for (int col = 0; col < numCols; col++) {
    //    rectMode(CENTER);
    //    int x = marginX + 50 + col * (innerBoxWidth + 10); // Add 50 pixels for left margin
    //    int y = marginY + 100 + row * (innerBoxHeight + 10); // Add 100 pixels for top margin
    //    println(x, ",", y, ",", innerBoxWidth, ",", innerBoxHeight);
    //    rect(x, y, innerBoxWidth, innerBoxHeight);
    //  }
    //  println("---------");
    //  rectMode(CORNER);
    //}

    for (int row = 0; row < numRows; row++) {
      for (int col = 0; col < numCols; col++) {
        for(int i = 0; i < armorButton.length; i++){
        rectMode(CENTER);
        int x = marginX + 50 + col * (innerBoxWidth + 10); // Add 50 pixels for left margin
        int y = marginY + 100 + row * (innerBoxHeight + 10); // Add 100 pixels for top margin
        println(x, ",", y, ",", innerBoxWidth, ",", innerBoxHeight);
//        rect(x, y, innerBoxWidth, innerBoxHeight);
        armorButton[i] = new Button (x, y, innerBoxWidth, innerBoxHeight);
        println(armorButton[i]);
        armorButton[i].display();
        }
      }
      println("---------");
      rectMode(CORNER);
<<<<<<< Updated upstream
=======
>>>>>>> cc037ea3f81397e1e5b66f362f2c7f64aaabbaf0
>>>>>>> Stashed changes
    }
  }
}
