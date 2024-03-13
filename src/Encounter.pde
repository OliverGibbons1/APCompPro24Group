// Completed by Ian Turner
class Encounter {
  Player player;
  String dialogue, consoleMessage;
  Enemy enemy;
  Button attackButton, healButton, smallPB, medPB, largePB, cancPB;
  boolean playerTurn = true;
  boolean over = false;
  boolean healSelect = false;
  PImage playerSprite;

  Encounter(Enemy enemy, String dialogue, Player player) {
    this.dialogue = dialogue;
    this.player = player;
    this.enemy = enemy;
    attackButton = new Button(175, 480, 100, 40, 'e');
    healButton = new Button(375, 480, 100, 40, 'e');
    smallPB = new Button(175, 440, 100, 40, 'e');
    medPB = new Button(275, 440, 100, 40, 'e');
    largePB = new Button(375, 440, 100, 40, 'e');
    cancPB = new Button(275, 480, 100, 40, 'e');
    consoleMessage = this.dialogue;
    this.over = false;
    playerSprite = loadImage("Sprites/JackStance.png");
  }

  void tick() {

    if (playerTurn) {
      if (this.enemy.health <= 0) {
        display();
        delay(2000);
        end();
      } else if (attackButton.pressed() && !healSelect) {
        this.player.attack(this.enemy, this.player.damage);
        consoleMessage = "Player hit " + enemy.name + " for " + this.player.damage + " damage";
        display();
        playerTurn = false;
      } else if (healButton.pressed() && !healSelect) {
        healSelect = true;
        consoleMessage = "Choose health potion";
        display();
        //playerTurn = false;
      } else if (healSelect) {
        if (smallPB.pressed()) {
          if (over == true) { // check for potion here
            //heal here, pass turn
          } else {
            consoleMessage = "No small potion available";
          }
        }
        if (medPB.pressed()) {
          if (over == true) { // check for potion here
            //heal here, pass turn
          } else {
            consoleMessage = "No medium potion available";
          }
        }
        if (largePB.pressed()) {
          if (over == true) { // check for potion here
            //heal here, pass turn
          } else {
            consoleMessage = "No large potion available";
          }
        }
        if (cancPB.pressed()) {
          consoleMessage = ("Choose action");
          healSelect = false;
        }
      }
    } else {
      enemyTurn();
    }
  }


  void end() {
    //delay(2000);
    this.over = true;
  }

  void enemyTurn() {
    delay(2000);
    if (this.enemy.health > 0) {
      this.enemy.attack(this.player);
      consoleMessage = this.enemy.name + " hit player for " + this.enemy.damage + " damage. Your move?";
      playerTurn = true;
    } else {
      this.player.money += this.enemy.money;
      consoleMessage = "You win! Got ₽" + this.enemy.money;
      display();
      playerTurn = true;
    }
  }

  void display() {
    textAlign(LEFT);
    fill(155);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    image(enemy.sprite, 300, 150);
    image(playerSprite, 20, 180);
    fill(0);
    text(enemy.name + "~", 70, 83);
    text("Health: " + enemy.health, 200, 83);
    text("Player~", 323, 83);
    text("Health: " + player.health, 446, 83);
    stroke(255);
    fill(0);
    if (!healSelect) {
      attackButton.display();
      healButton.display();
      fill(255);
      text("Attack", 200, 510);
      text("Heal", 400, 510);
    } else {
      smallPB.display();
      medPB.display();
      largePB.display();
      cancPB.display();
      fill(255);
      text("Small", 200, 470);
      text("Medium", 300, 470);
      text("Large", 400, 470);
      text("Cancel", 300, 510);
    }
    fill(0);
    text(consoleMessage, 75, 575);
  }
}
