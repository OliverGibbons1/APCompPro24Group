class Encounter {
  Player player;
  String dialogue, consoleMessage;
  Enemy enemy;
  Button attackButton, healButton;
  boolean playerTurn = true;
  boolean over = false;

  Encounter(Enemy enemy, String dialogue, Player player) {
    this.dialogue = dialogue;
    this.player = player;
    this.enemy = enemy;
    attackButton = new Button(175, 480, 100, 40);
    healButton = new Button(375, 480, 100, 40);
    consoleMessage = this.dialogue;
    this.over = false;
  }

  void tick() {

    if (playerTurn) {
      if (attackButton.pressed()) {
        this.player.attack(this.enemy, 2);
        if(this.enemy.health > 0){
          consoleMessage = "Player hit " + enemy.name + " for " + this.player.damage + " damage";
          display();
          playerTurn = false;
        } else {
          this.over = true;
        }
      }
    } else {
      enemyTurn();
    }
  }


  void enemyTurn() {
    delay(2000);
    this.enemy.attack(this.player);
    consoleMessage = this.enemy.name + " hit player for " + this.enemy.damage + " damage. Your move?";
    playerTurn = true;
  }

  void display() {
    fill(155);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    image(enemy.sprite, 70, 150);
    image(player.sprite, 450, 200);
    fill(0);
    text(enemy.name + "~", 70, 83);
    text("Health: " + enemy.health, 200, 83);
    text("Player~", 323, 83);
    text("Health: " + player.health, 446, 83);
    stroke(255);
    fill(0);
    attackButton.display();
    healButton.display();
    text(consoleMessage, 75, 575);
    fill(255);
    text("Attack", 200, 510);
    text("Heal", 400, 510);
  }
}
