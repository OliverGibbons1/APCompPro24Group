Player P1;
Encounter[] Encounters;
Shop[] Shops;
Map M1;
Button startButton, quitButton;
PImage startScreen;
boolean start = false;

void setup() {
  size(620, 620);
  M1 = new Map("TitleScreen.png");
  startButton = new Button(240, 415, 140, 60);
  quitButton = new Button(240, 492, 140, 60);
}
void draw() {
  M1.display();
  if (start == false) {
    noFill();
    noStroke();
    startButton.display();
    quitButton.display();
    if (startButton.pressed()) {
      M1.loadNew("DemoImage.png");
      start = true;
    }
    if (quitButton.pressed()) {
      exit();
    }
  }
}
