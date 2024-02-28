class Shop {
  Player player;
  String dialogue, consoleMessage;
  Button weaponButton, armorButton;
  boolean playerTurn = true;

  Shop() {
    consoleMessage = this.dialogue;
    weaponButton = new Button(175, 480, 100, 40);
    armorButton = new Button(375, 480, 100, 40);
  }

  void customer() {
    dialogue = "Welcome to the shop! Buy what you can, and get more gold if you can't";
    if (weaponButton.pressed()) {
      weaponDisplay();
    } else if (armorButton.pressed()) {
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
    weaponButton.display();
    armorButton.display();
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
    weaponButton.display();
    armorButton.display();
    text("Weapon", 200, 510);
    text("Armor", 400, 510);

    int screenWidth = 540;
    int screenHeight = 540;

    int numBoxes = 5;
    int margin = 10; // space around each box
    int boxWidth = (screenWidth - 5 * margin) / 4; // width of each box
    int boxHeight = (screenHeight - 3 * margin) / 2; // height of each box

    // Coordinates for the first row of boxes
    int startX = margin;
    int startY = margin;
    for (int i = 0; i < 4; i++) {
      int x = startX + i * (boxWidth + margin);
      int y = startY;
      rect(x, y, boxWidth, boxHeight);
    }

    // Coordinates for the centered box
    int centerX = (screenWidth - boxWidth) / 2;
    int centerY = startY + boxHeight + margin;
    rect(centerX, centerY, boxWidth, boxHeight);
  }
  void armorDisplay(){
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
    weaponButton.display();
    armorButton.display();
    text("Weapon", 200, 510);
    text("Armor", 400, 510);


  }
}
