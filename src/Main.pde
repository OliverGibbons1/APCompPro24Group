Player P1;
Encounter[] Encounters;
Shop[] Shops;
Player p;
Map M1;
Button startButton, quitButton, loadGameButton;
Enemy testEnemy;
Encounter testEncounter;
PImage startScreen;
boolean start = false;
boolean savedGame = false;
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

    String s = "Start";
    String q = "Quit";
    String l = "Load Game";
    String i = " ";
    textSize(28);
    text(s, 280, 455);
    text(q, 280, 535);
    text(l, 245, 609);
    fill(0);
    if (startButton.pressed()) {
      M1.loadNew("Sprites/DemoImage.png");
      M1.resize(640, 640);
      start = true;
      s = s.equals(i) ? i:s;
      testEncounter.begin();
      testStart = true;
      p.health = 5;
    }
    if(loadGameButton.pressed()){
      if(savedGame){
    loadJSONObject("data.json");
    p.health = saveGame.getInt("health");
    p.money = saveGame.getInt("money");
    p.x = saveGame.getInt("x");
    p.y = saveGame.getInt("y");
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
  }
  
  //Testing
  if(testStart == true){
    testEncounter.display();
  }
}
void saveGame(){
  saveGame.setInt("health", p.health);
  saveGame.setInt("money", p.money);
  saveGame.setInt("x", p.x);
  saveGame.setInt("y", p.y);
  saveJSONObject(saveGame, "data/new.json");
  savedGame = true;
  exit();
}
