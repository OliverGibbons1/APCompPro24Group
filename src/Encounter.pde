class Encounter{
  Player player;
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  String dialogue, consoleMessage;
  Enemy enemy;
  Button attackButton, healButton;
  boolean playerTurn = true;
  
  Encounter(Enemy enemy, String dialogue, Player player){
    enemies.add(enemy);
    this.dialogue = dialogue;
    this.player = player;
    this.enemy = enemy;
    attackButton = new Button(175, 480, 100, 40);
    healButton = new Button(375, 480, 100, 40);
    consoleMessage = this.dialogue;
  }
  
  void tick() {
    if(playerTurn){
      if(attackButton.pressed()){
        this.player.attack(this.enemy, 1);
        consoleMessage = "Player hit enemy for 1 damage";
        display();
        playerTurn = false;
      }
    }
    else {
      enemyTurn();
    }
  }
  
  void enemyTurn() {
    delay(2000);
    this.enemy.attack(this.player);
    consoleMessage = this.enemy.name + " hit player for " + this.enemy.damage + " damage. Your move?";
    playerTurn = true;
  }
  
  //void begin(){
  //  print(dialogue);
  //  for (int i = 0; i<enemies.size(); i++){
  //    Enemy e = enemies.get(i);
  //    player.attack(e, 1);
  //  }
  //}
  
  //void turnChange(){
  //  for (int i = 0; i<enemies.size(); i++){
  //    Enemy e = enemies.get(i);
  //    e.attack(this.player);
  //  }
  //}
  
  void display(){
    fill(0);
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
