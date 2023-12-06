class Button{
  int x, y, sizex, sizey, halfx, halfy;
  
  Button(int x, int y, int sizex, int sizey){
    this.x = x;
    this.y = y;
    this.sizex = sizex;
    this.sizey = sizey;
    this.halfx = sizex/2;
    this.halfy = sizey/2;
  }
  
  boolean pressed(){
    if(mouseX < x+halfx && mouseX > x-halfx && mouseY < y+halfy && mouseY > y-halfy){
      return true;
    }
    else {
      return false;
    }
  }
}
