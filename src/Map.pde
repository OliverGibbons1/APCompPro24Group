class Map{
  PImage mapImage;
  PImage[] MapSprites;
  JSONObject MapJSON;
  int[][] MapData;
  int[] coords;
  int[] tileSize={32,32};
  int[] mapSize={10,10};
  String FileN="";
  ArrayList<Integer> RelevantTiles;
  
  
  Map(String MapFileName){
    loadNew(MapFileName);
    mapImage = loadImage("Sprites/TitleScreen.png");
  }
  
  void loadNew(String newMap){
    RelevantTiles=new ArrayList<Integer>();
    if (FileN==newMap) {
      return;
    }
    FileN=newMap;
    MapJSON=loadJSONObject(FileN);
    JSONArray MapJSONArray=MapJSON.getJSONArray("MapTiles");
    MapData=new int[mapSize[0]][mapSize[1]];
    for (int y=0;y<MapJSONArray.size();y++) {
      for (int x=0;x<MapJSONArray.getJSONArray(y).size();x++) {
        MapData[y][x]=MapJSONArray.getJSONArray(y).getInt(x);
        if (!(RelevantTiles.contains(MapData[y][x]))) { // For Optimization
          RelevantTiles.add(MapData[y][x]);
        }
        //print(Integer.toString(MapData[y][x])+" ");
      }
      //println("");
    }
    JSONArray MapImagesJSONArr=MapJSON.getJSONArray("MapTilesRef");
    MapSprites=new PImage[MapImagesJSONArr.size()];
    for (int s=0;s<MapImagesJSONArr.size();s++) {
      MapSprites[s]=loadImage("Sprites/MapTiles/MapBack/"+MapImagesJSONArr.getString(s));
    }
    displayMap();
  }

  void displayMap() {
    //println(width/mapSize[0]);
    for (int y=0;y<MapData.length;y++) {
      for (int x=0;x<MapData[y].length;x++) {
        //print(MapData[y][x]+" ");
        image(MapSprites[MapData[y][x]],x*width/mapSize[0],y*height/mapSize[1],width/mapSize[0],height/mapSize[1]);
      }
    //println("");
    }
  }
  
  void display(){
    image(mapImage, 0, 0);
  }
  void resize(int w, int h) {
    mapImage.resize(w,h);
  }
}
