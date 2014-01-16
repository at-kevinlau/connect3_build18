int WINDOW_WIDTH = 800;
int WINDOW_HEIGHT = 600;

// All game objects that can be drawn
ArrayList<Renderable> renderables;
// All game objects that can be interacted with (with the mouse)
ArrayList<Updatable> updatables;

void setup()
{
  // init
  size(WINDOW_WIDTH, WINDOW_HEIGHT);
  renderables = new ArrayList<Renderable>();
  updatables = new ArrayList<Updatable>();
  
  /*
   * GUI
   */
  
  // Button 1
  Button b1 = new Button(w_percent(.05),h_percent(.020),w_percent(.15),h_percent(.04))
  {
    public void onClickAction()
    {
    }
    public void onReleaseAction()
    {
      System.out.println("release");
    }
  };
  renderables.add(b1);
  updatables.add(b1);
  // Button 2
  Button b2 = new Button(w_percent(.30),h_percent(.020),w_percent(.15),h_percent(.04));
  renderables.add(b2);
  updatables.add(b2);
  // Button 3
  Button b3 = new Button(w_percent(.55),h_percent(.020),w_percent(.15),h_percent(.04));
  renderables.add(b3);
  updatables.add(b3);
  // Button 4
  Button b4 = new Button(w_percent(.80),h_percent(.020),w_percent(.15),h_percent(.04));
  renderables.add(b4);
  updatables.add(b4);
  
  // Board
  Board board = new Board(10, 10, 200, 200);
  renderables.add(board);
  updatables.add(board);
}

void draw()
{
  update(mouseX, mouseY);
  renderGame();
}

void update(int mX, int mY)
{
  for (Updatable u : updatables)
  {
    u.update(mX, mY);
  }
}

void renderGame()
{
  smooth();
  background(255,255,255);

  for (Renderable r : renderables)
  {
    r.render();
  }
  
  fill(0,0,0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("text", WINDOW_WIDTH/2, WINDOW_HEIGHT/2);
}

/*
 * Input/events
 */

void mousePressed()
{
  for (Updatable u : updatables)
  {
    u.registerMClick(mouseX, mouseY);
  }
}
void mouseReleased()
{
  for (Updatable u : updatables)
  {
    u.registerMRelease(mouseX, mouseY);
  }
}


/*
 * Util methods
 */

/*
 * Return a number of pixels equal to the given percentage of the screen width/height
 */
int w_percent(float percent)
{
  return (int) (percent * WINDOW_WIDTH);
}
int h_percent(float percent)
{
  return (int) (percent * WINDOW_HEIGHT);
}

