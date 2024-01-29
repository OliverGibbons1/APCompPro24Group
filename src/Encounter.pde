class Encounter{
  Player player;
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  String dialogue;
  
  Encounter(Enemy enemy, String dialogue, Player player){
    enemies.add(enemy);
    this.dialogue = dialogue;
    this.player = player;
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
}
