Player P1;
Encounter[] Encounters;
Shop[] Shops;
Map M1;
PImage startScreen;

void setup(){
  size(620, 620);
  startScreen = loadImage("TitleScreen.png");
}
void startEncounter(){
}
void draw(){
  image(startScreen, 0, 0);
}
