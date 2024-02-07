class Map{
  PImage mapImage;
  PImage mapSpSheet;
  JSONObject Map;
  int[] coords;
  
  Map(String MapFileName){
    Map=loadJSONObject(MapFileName);
    mapImage = loadImage("Sprites/TitleScreen.png");
  }
  
  void loadNew(String newImage){
    mapImage = loadImage(newImage);
  }
  void loadMap() {
    
  }
  
  void display(){
    image(mapImage, 0, 0);
  }
  void resize(int w, int h) {
    mapImage.resize(w,h);
  }
}
