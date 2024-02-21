class Map {
  PImage mapImage;
  PImage mapSpSheet;
  PImage[] MapSprites;
  JSONObject MapJSON;
  int[][] MapData;
  int[] coords;
  int[] tileSize;
  ArrayList<Integer> RelevantTiles;

  Map(String MapFileName) {
    RelevantTiles=new ArrayList<Integer>();
    int[] tileSize={32, 32};
    MapJSON=loadJSONObject(MapFileName);
    JSONArray MapJSONArray=MapJSON.getJSONArray("MapTiles");
    int[][] MapData=new int[10][10];
    for (int y=0; y<MapJSONArray.size(); y++) {
      for (int x=0; x<MapJSONArray.getJSONArray(y).size(); x++) {
        MapData[y][x]=MapJSONArray.getJSONArray(y).getInt(x);
        if (!(RelevantTiles.contains(MapData[y][x]))) {
          RelevantTiles.add(MapData[y][x]);
          //println(MapData[y][x]);
        }
        print(Integer.toString(MapData[y][x])+" ");
      }
      println("");
    }
    mapImage = loadImage("Sprites/TitleScreen.png");
  }

  void loadNew(String newImage) {
    mapImage = loadImage(newImage);
  }
  void loadMap() {
  }

  void display() {
    image(mapImage, 0, 0);
  }
  void resize(int w, int h) {
    mapImage.resize(w, h);
  }
}
