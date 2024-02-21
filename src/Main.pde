Player P1;
Encounter[] Encounters;
Shop[] Shops;
Player p;
Map M1;
Button startButton, quitButton, loadGameButton, clearSaveButton;
Enemy testEnemy;
Encounter testEncounter;
PImage startScreen;
boolean start = false;
boolean savedGame;
JSONObject saveGame;

boolean testStart = false;

void setup() {
  size(640, 640);
  M1 = new Map("Maps/Map.json");
  p = new Player();
  testEnemy = new Enemy(4, 4, 4, "sprites/SinisterMan.png", "Test Enemy");
  testEncounter = new Encounter(testEnemy, "testing", p);
  startButton = new Button(240, 415, 140, 60);
  quitButton = new Button(240, 492, 140, 60);
  loadGameButton = new Button(240, 569, 140, 60);
  clearSaveButton = new Button(550, 575, 50, 50);
  M1.resize(640, 640);
  saveGame = new JSONObject();
}
void draw() {
  M1.display();
  if (start == false) {
    noFill();
    stroke(0);
    strokeWeight(2);
    startButton.display();
    quitButton.display();
    loadGameButton.display();
    clearSaveButton.display();

    String s = "Start";
    String q = "Quit";
    String l = "Load Game";
    String c = "Clear Save";
    String i = " ";
    textSize(28);
    text(s, 280, 455);
    text(q, 280, 535);
    text(l, 245, 609);
    textSize(10);
    text(c, 554, 604);
    fill(0);
    
    if (startButton.pressed()) {
      M1.loadNew("Sprites/DemoImage.png");
      M1.resize(640, 640);
      start = true;
      s = s.equals(i) ? i:s;
      p.health = 5;
      testEncounter.begin();
      //testStart = true;
    }
    if(loadGameButton.pressed()){
    saveGame = loadJSONObject("data/new.json");
    savedGame = saveGame.getBoolean("savedGame");
      if(savedGame){
    p.health = saveGame.getInt("health");
    p.money = saveGame.getInt("money");
    p.x = saveGame.getInt("x");
    p.y = saveGame.getInt("y");
    M1.loadNew("Sprites/DemoImage.png");
      M1.resize(640, 640);
      start = true;
      s = s.equals(i) ? i:s;
      } else {
      M1.loadNew("Sprites/DemoImage.png");
      M1.resize(640, 640);
      start = true;
      s = s.equals(i) ? i:s;
      }
    }
    if (quitButton.pressed()) {
      exit();
    }
    if (clearSaveButton.pressed()) {
    clearSave();
    }
     //saveGame testing
     //if (mousePressed == true){
     // testSave();
     // saveGame();
     // }
  }
  
  //Testing
  if(start == true){
    p.display();
  }
  
  //if(testStart == true){
  //  testEncounter.display();
  //}
  
  p.move();
  
}
void saveGame(){
  savedGame = true;
  saveGame.setInt("health", p.health);
  saveGame.setInt("money", p.money);
  saveGame.setInt("x", p.x);
  saveGame.setInt("y", p.y);
  saveGame.setBoolean("savedGame", true);
  saveJSONObject(saveGame, "data/new.json");
  exit();
}
void clearSave(){
  savedGame = false;
  saveGame.setInt("health", 0);
  saveGame.setInt("money", 0);
  saveGame.setInt("x",0);
  saveGame.setInt("y", 0);
  saveGame.setBoolean("savedGame", false);
  saveJSONObject(saveGame, "data/new.json");
}
void testSave(){
  p.health = 101;
  p.money = 126;
  p.x = 11;
  p.y = 11;
}
