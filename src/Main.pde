// Completed by all of us
Player P1;
Encounter[] Encounters;
Shop shop;
Player p;
Map M1;
Button startButton, quitButton, loadGameButton, clearSaveButton, resetButton;
Enemy enemy;
Encounter encounter;
PImage startScreen;
boolean start = false;
boolean savedGame;
JSONObject saveGame;

boolean shopOn = false;
boolean encounterOn = false;
int AlreadyPressed = 0;

void setup() {
  size(640, 640);
  M1 = new Map("Maps/Map.json");
  p = new Player();
  shop = new Shop();
  enemy = new Enemy(10, 4, 20, "sprites/NPCSprites/SinisterMan.png", "Sinister Man");
  encounter = new Encounter(enemy, "Hello there", p);
  startButton = new Button(240, 415, 140, 60, 'm');
  quitButton = new Button(240, 492, 140, 60, 'm');
  loadGameButton = new Button(240, 569, 140, 60, 'm');
  clearSaveButton = new Button(550, 575, 50, 50, 'm');
  resetButton = new Button(240, 492, 140, 60, 'm');
  M1.resize(640, 640);
  saveGame = new JSONObject();
  p.health = 5;
  p.maxHealth = 5;
  p.money = 1100;
}
void draw() {
  if (start) {
    M1.displayMap();
    if (keyPressed && AlreadyPressed<=0) {
      AlreadyPressed=10;
      if (key==' ') {
        encounterOn =! encounterOn;
      }else if (key == 'p'){
        shopOn =! shopOn;
      }
    } else {
      AlreadyPressed-=1;
    }
  }
//StartScreen buttons completed by Oliver Gibbons
  if (start == false) {
    M1.display();
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
      M1.loadNew("Maps/Map.json");
      M1.resize(640, 640);
      start = true;
      s = s.equals(i) ? i:s;
    }
    if (loadGameButton.pressed()) {
      saveGame = loadJSONObject("data/new.json");
      savedGame = saveGame.getBoolean("savedGame");
      if (savedGame) {
        p.health = saveGame.getInt("health");
        p.money = saveGame.getInt("money");
        p.x = saveGame.getInt("x");
        p.y = saveGame.getInt("y");
        M1.loadNew("Maps/Map.json");
        M1.resize(640, 640);
        start = true;
        s = s.equals(i) ? i:s;
      } else {
        M1.loadNew("Maps/Map.json");
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
  }

  if (start) {
    p.display();
  }
  //testing shop and encounter
  if (encounterOn == true) {
    encounter.display();
    encounter.tick();

    if (p.health <= 0 || encounter.over) {
      encounterOn = false;
    }
  }

  if (!encounterOn && !shopOn) {
    p.move(M1.MapBoundData);
  }

  if (shopOn) {
    shop.display();
    if (shop.quit) {
      shopOn = false;
    }
  }

  if (checkGameOver()) {
    String t = "Try Again?";
    String i = " ";
    PImage end = loadImage("Maps/GameOver1.png");
    end.resize(640, 640);
    background(end);
    fill(255);
    resetButton.display();
    fill(0);
    text(t, 270, 530);
    if (resetButton.pressed()) {
      gameOverReset();
      M1.loadNew("Maps/Map.json");
      M1.resize(640, 640);
      t = t.equals(i) ? i:t;
      // take down encounter screen here DO NOT AWARD GOLD
      enemy = new Enemy(4, 4, 4, "sprites/SinisterMan.png", "Test Enemy");
      encounter = new Encounter(enemy, "Back again, Blue Guy?", p);
    }
  }
  
  if(keyCode == 9){
    saveGame();
    println("Game Saved");
  }
}
//All saveGame aspects by Oliver Gibbons
void saveGame() {
  savedGame = true;
  saveGame.setInt("health", p.health);
  saveGame.setInt("money", p.money);
  saveGame.setInt("x", p.x);
  saveGame.setInt("y", p.y);
  saveGame.setBoolean("savedGame", true);
  saveJSONObject(saveGame, "data/new.json");
  exit();
}
void clearSave() {
  savedGame = false;
  saveGame.setInt("health", 0);
  saveGame.setInt("money", 0);
  saveGame.setInt("x", 0);
  saveGame.setInt("y", 0);
  saveGame.setBoolean("savedGame", false);
  saveJSONObject(saveGame, "data/new.json");
}
boolean checkGameOver() {
  if (p.health <= 0) {
    return true;
  } else {
    return false;
  }
}
void gameOverReset() {
  p.money = p.money/2;
  p.x = 0;
  p.y = 0;
  p.health = p.maxHealth;
}
