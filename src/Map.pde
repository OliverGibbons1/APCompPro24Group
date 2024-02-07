class Map{
  PImage mapImage;
  PImage mapSpSheet;
  PImage[] MapSprites;
  JSONObject MapJSON;
  int[][] MapData;
  int[] coords;
  int[] tileSize;
  
  Map(String MapFileName){
    int[] tileSize={32,32};
    MapJSON=loadJSONObject(MapFileName);
    JSONArray MapJSONArray=MapJSON.getJSONArray("Map");
    int[][] MapData=new int[10][10];
    //for (int y=0;y<MapJSONArray.size();y+=tileSize[1]) {
    //  for (int x=0;x<MapJSONArray.getJSONArray(y).size();x+=tileSize[0]) {
    //    MapData[y][x]=MapJSONArray.getJSONArray(y).getInt(x);
    //  }
    //}
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
