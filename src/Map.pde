class Map{
  PImage mapImage;
  PImage[] MapBackSprites;
  PImage[] MapNPCSprites;
  PImage[] MapForeSprites;
  JSONObject MapJSON;
  int[][] MapBackData;
  int[][] MapNPCData;
  int[][] MapForeData;
  String[][] MapEventData; // Fix later
  Boolean[][] MapBoundData;
  int[] coords;
  int[] tileSize={32,32};
  int[] mapSize={10,10};
  String FileN="";
  
  
  Map(String MapFileName){
    loadNew(MapFileName);
    mapImage = loadImage("Sprites/TitleScreen.png");
  }
  
  void loadNew(String newMap){
    if (FileN==newMap) {
      return;
    }
    FileN=newMap;
    MapJSON=loadJSONObject(FileN);
    JSONArray MapJSONArray=MapJSON.getJSONArray("MapBackTiles");
    JSONArray NPCJSONArray=MapJSON.getJSONArray("MapNPCTiles");
    JSONArray ForeJSONArray=MapJSON.getJSONArray("MapForeTiles");
    JSONArray EventJSONArray=MapJSON.getJSONArray("MapEventTiles");
    JSONArray BoundJSONArray=MapJSON.getJSONArray("Boundary");
    MapBackData=new int[mapSize[0]][mapSize[1]];
    MapNPCData= new int[mapSize[0]][mapSize[1]];
    MapForeData= new int[mapSize[0]][mapSize[1]];
    MapEventData= new String[mapSize[0]][mapSize[1]];
    MapBoundData= new Boolean[mapSize[0]][mapSize[1]];
    for (int y=0;y<MapJSONArray.size();y++) {
      for (int x=0;x<MapJSONArray.getJSONArray(y).size();x++) {
        MapBackData[y][x]=MapJSONArray.getJSONArray(y).getInt(x);
        MapNPCData[y][x]=NPCJSONArray.getJSONArray(y).getInt(x);
        MapForeData[y][x]=ForeJSONArray.getJSONArray(y).getInt(x);
        MapEventData[y][x]=EventJSONArray.getJSONArray(y).getJSONObject(x).getString("type");
        MapBoundData[y][x]=BoundJSONArray.getJSONArray(y).getBoolean(x);
      }
      //println("");
    }
    JSONArray MapImagesJSONArr=MapJSON.getJSONArray("MapBackRef");
    JSONArray NPCImagesJSONArr=MapJSON.getJSONArray("MapNPCRef");
    JSONArray ForeImagesJSONArr=MapJSON.getJSONArray("MapForeRef");
    MapBackSprites=new PImage[MapImagesJSONArr.size()];
    for (int s=0;s<MapImagesJSONArr.size();s++) {
      MapBackSprites[s]=loadImage("Sprites/MapTiles/MapBack/"+MapImagesJSONArr.getString(s));
    }
    MapNPCSprites=new PImage[NPCImagesJSONArr.size()];
    for (int s=0;s<NPCImagesJSONArr.size();s++) {
      MapNPCSprites[s]=loadImage("Sprites/NPCSprites/"+NPCImagesJSONArr.getString(s));
    }
    MapForeSprites=new PImage[ForeImagesJSONArr.size()];
    for (int s=0;s<ForeImagesJSONArr.size();s++) {
      MapForeSprites[s]=loadImage("Sprites/MapTiles/MapFore/"+ForeImagesJSONArr.getString(s));
    }
    displayMap();
  }

  void displayMap() {
    for (int y=0;y<MapBackData.length;y++) {
      for (int x=0;x<MapBackData[y].length;x++) {
        image(MapBackSprites[MapBackData[y][x]],x*width/mapSize[0],y*height/mapSize[1],width/mapSize[0],height/mapSize[1]);
      }
    }
    for (int y=0;y<MapNPCData.length;y++) {
      for (int x=0;x<MapNPCData[y].length;x++) {
        if (MapNPCData[y][x] == -1) {
         continue;
        }
        image(MapNPCSprites[MapNPCData[y][x]],x*width/mapSize[0],y*height/mapSize[1],width/mapSize[0],height/mapSize[1]);
      }
    }
    for (int y=0;y<MapForeData.length;y++) {
      for (int x=0;x<MapForeData[y].length;x++) {
        if (MapForeData[y][x] == -1) {
         continue;
        }
        image(MapForeSprites[MapForeData[y][x]],x*width/mapSize[0],y*height/mapSize[1],width/mapSize[0],height/mapSize[1]);
      }
    }
  }
  
  
  
  void display(){
    image(mapImage, 0, 0);
  }
  void resize(int w, int h) {
    mapImage.resize(w,h);
  }
}
