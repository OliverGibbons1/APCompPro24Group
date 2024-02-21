class Encounter{
  Player player;
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  String dialogue;
  Enemy enemy;
  
  Encounter(Enemy enemy, String dialogue, Player player){
    enemies.add(enemy);
    this.dialogue = dialogue;
    this.player = player;
    this.enemy = enemy;
  }
  
  void begin(){
    print(dialogue);
    for (int i = 0; i<enemies.size(); i++){
      Enemy e = enemies.get(i);
      player.attack(e, 1);
    }
  }
  
  void turnChange(){
    for (int i = 0; i<enemies.size(); i++){
      Enemy e = enemies.get(i);
      e.attack(this.player);
    }
  }
  
  void display(){
    fill(0);
    textSize(20);
    stroke(255);
    rect(50, 50, 540, 540);
    fill(255);
    rect(50, 50, 540, 50);
    rect(50, 540, 540, 50);
    image(enemy.sprite, 70, 200);
    image(player.sprite, 450, 200);
    fill(0);
    text(enemy.name + "~", 70, 83);
    text("Health: " + enemy.health, 200, 83);
    text("Player~", 323, 83);
    text("Health: " + player.health, 446, 83);
  }
}
