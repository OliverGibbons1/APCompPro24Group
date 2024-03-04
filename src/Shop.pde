class Shop {
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
      weaponDisplay();
    } else if (selectButton[1].pressed()) {
      armorDisplay();
    }
  }

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

  void weaponDisplay() {
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
    //for(int i = 0; i < weaponButton.length; i++){
    //  weaponButton[i].display();
    //}
  }
  void armorDisplay() {
    fill(155);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    fill(0);
    //    text("Gold: " + player.money, 290, 83);
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
    }
  }
}
