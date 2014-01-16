class Board implements Renderable, Updatable
{
  private boolean[][] spaces;
  private int x,y,w,h;
  
  Board(int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    spaces = new boolean[h][w];
    int numTilesAcross = spaces[0].length;
    int numTilesHigh = spaces.length;
    
    int tileWidth = this.w / numTilesAcross;
    int tileHeight = this.h / numTilesHigh;
    System.out.println("Board dimensions (tiles): "+numTilesAcross+","+numTilesHigh);
    System.out.println("Board tile dimensions (px): "+tileWidth+","+tileHeight);
    
    /*
    for (boolean[] a : board)
    {
      for (boolean b : a)
      {
        b = false;
      }
    }
    */
    
  }
  
  void render()
  {
   /* 
    for (int i = 0; i < numTilesHigh; i++)
    {
      for (int j = 0; j < numTilesAcross; j++)
      {
//        fill(random(0,255),random(0,255),random(0,255));
        //rect(x+j*tileWidth, y+i*tileHeight, tileWidth, tileHeight);
        
        System.out.println("x,y,w,h: " + j*tileWidth +","+ i*tileHeight +","+ tileWidth +","+ tileHeight);
      }
    }
    */
  }
  void update(int mX, int mY)
  {
  }
  void registerMClick(int mX, int mY)
  {
  }
  void registerMRelease(int mX, int mY)
  {
  }
}

