Player P1;
Encounter[] Encounters;
Shop[] Shops;
Map M1;
Button startButton, quitButton;
PImage startScreen;
boolean start = false;

void setup() {
  size(640, 640);
  M1 = new Map("Sprites/TitleScreen.png");
  startButton = new Button(240, 415, 140, 60);
  quitButton = new Button(240, 492, 140, 60);
  M1.resize(640, 640);
}
void draw() {
  M1.display();
  if (start == false) {
    noFill();
    noStroke();
    startButton.display();
    quitButton.display();

    String s = "Start";
    String q = "Quit";
    String i = " ";
    textSize(32);
    text(s, 289, 470);
    text(q, 289, 550);
    fill(0);
    if (startButton.pressed()) {
      M1.loadNew("Sprites/DemoImage.png");
      M1.resize(640, 640);
      start = true;
      s = s.equals(i) ? i:s;
    }
    if (quitButton.pressed()) {
      exit();
    }
  }
}
