class Map{
  PImage mapImage;
  int[] coords;
  
  Map(String imageName){
    mapImage = loadImage(imageName);
  }
  
  void loadNew(String newImage){
    mapImage = loadImage(newImage);
  }
  
  void display(){
    image(mapImage, 0, 0);
  }
}
