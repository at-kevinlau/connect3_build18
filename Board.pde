class Board implements Renderable, Updatable
{
  private Player[][] spaces;
  private int x,y,w,h,numTilesAcross,numTilesHigh;
  private final int LENGTH_TO_WIN = 3;
  
  Board(int x, int y, int w, int h, int numTilesAcross, int numTilesHigh)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    spaces = new Player[numTilesAcross][numTilesHigh];
    
    this.numTilesAcross = numTilesAcross;
    this.numTilesHigh = numTilesHigh;
    
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
    int tileWidth = this.w / numTilesAcross;
    int tileHeight = this.h / numTilesHigh;
    stroke(0,0,0);
    for (int i = 0; i < numTilesAcross; i++)
    {
      for (int j = 0; j < numTilesHigh; j++)
      {
        Player p = spaces[i][j];
        if (p != null)
        {
          fill(p.myColor);
        } else
        {
          fill(255,255,255);
        }
        rect(x+i*tileWidth, y+j*tileHeight, tileWidth, tileHeight);
        
//        System.out.println("x,y,w,h: " + j*tileWidth +","+ i*tileHeight +","+ tileWidth +","+ tileHeight);
      }
    }
  }
  /**
   *
   * @return if piece was dropped
   */
  boolean dropPiece(int column, Player p)
  {
    if (column < 1 || column > spaces.length)
    {
      System.out.println("dropPiece: Attempted to drop piece at column " + column);
    }
    for (int i = spaces[column-1].length - 1; i >= 0; i--)
    {
      if (spaces[column-1][i] == null)
      {
        System.out.println("Found empty space at height " + i);
        spaces[column-1][i] = p;
        return true;
      }
    }
    return false;
  }
  
  Player checkWinner()
  {    
    // check starting from bottom left
    for (int i = 0; i < spaces.length; i++)
    {
      for (int j = 0; j < spaces[i].length; j++)
      {
        Player playerInSpace = spaces[i][j]; 
        if (playerInSpace != null)
        {
          // check to the right
          for (int inARow = 1; inARow < LENGTH_TO_WIN; inARow++)
          {
            if (i+inARow >= spaces.length)
            {
              break;
            }
            if (spaces[i+inARow][j] != playerInSpace)
            {
              break;
            }
            if (inARow == LENGTH_TO_WIN-1)
            {
              return playerInSpace;
            }
          }
          // check up
          for (int inARow = 1; inARow < LENGTH_TO_WIN; inARow++)
          {
            if (j+inARow >= spaces[i].length)
            {
              break;
            }
            if (spaces[i][j+inARow] != playerInSpace)
            {
              break;
            }
            if (inARow == LENGTH_TO_WIN-1)
            {
              return playerInSpace;
            }
          }
          // check diagonally left
          for (int inARow = 1; inARow < LENGTH_TO_WIN; inARow++)
          {
            if (j-inARow < 0 || i-inARow < 0)
            {
              break;
            }
            if (spaces[i-inARow][j-inARow] != playerInSpace)
            {
              break;
            }
            if (inARow == LENGTH_TO_WIN-1)
            {
              return playerInSpace;
            }
          }
          // check diagonally right
          for (int inARow = 1; inARow < LENGTH_TO_WIN; inARow++)
          {
            if (j-inARow < 0 || i+inARow >= spaces.length)
            {
              break;
            }
            if (spaces[i+inARow][j-inARow] != playerInSpace)
            {
              break;
            }
            if (inARow == LENGTH_TO_WIN-1)
            {
              return playerInSpace;
            }
          }
        }
      }
    }
    return null;
  }
  
  boolean boardFilled()
  {
    for (int i = 0; i < spaces.length; i++)
    {
      for (int j = 0; j < spaces[i].length; j++)
      {
        if (spaces[i][j] == null)
        {
          return false;
        }
      }
    }
    return true;
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

