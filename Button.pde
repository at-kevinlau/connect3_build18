class Button implements Updatable, Renderable
{
  private int x, y, w, h;
  private color baseColor, hoverColor, clickColor, currentColor;
  
  private boolean selected; 
  
  Button(int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    baseColor = color(255,255,255);
    hoverColor = color(0,0,0);
    clickColor = color(255,0,0);
    currentColor = baseColor;
    
    selected = false;
  }
  
  void update(int mX, int mY)
  {
    if (selected)
    {
      currentColor = clickColor;
    } else if (insideButton(mX, mY))
    {
      currentColor = hoverColor;
    } else
    {
      currentColor = baseColor;
    }
  }
  
  void render()
  {
    fill(currentColor);
    rect(x, y, w, h);
  }
  
  /*
   * Event registering
   */
  
  /*
   * Register mouse clicks/releases on this button
   */
  void registerMClick(int mX, int mY)
  {
    if (insideButton(mX, mY))
    {
      selected = true;
      onClickAction();
    }
  }
  void registerMRelease(int mX, int mY)
  {
    // do click action if this button was originally selected
    if (selected && insideButton(mX, mY))
    {
      onReleaseAction();
    }
    if (selected)
    {
      selected = false;
    }
  }
  
  /*
   * Actions that happen when mouse is clicked/released on this button
   */
  public void onClickAction()
  {
  }
  public void onReleaseAction()
  {
  }
  
  /*
   * Util methods
   */
  boolean insideButton(int mX, int mY)
  {
    return (mX >= x && mX <= x+w && mY >= y && mY <= y+h);
  }
}
