class Player {
  int xpos;
  int ypos;
  color paddlecolor = color(255);
  int k;
  int l;
  
  Player(int screen_y)
  {
    xpos = SCREENX/2;
    ypos = screen_y;
  }
  
  void move(int x) 
  {
    if(x > SCREENX-PADDLEWIDTH)
    {
      xpos = SCREENX - PADDLEWIDTH;
    }
    else xpos = x;
  }
  
  void moveComputer()
  {
    if (xpos > theBall.x || xpos >= SCREENX-PADDLEWIDTH)
    {
      xpos--;
    }
    else if (xpos < theBall.x || xpos <= 0)
    {
      xpos++;
    }
  }
  boolean theComputerWins()
  {
    boolean theBallHitsWall = false;
    if ( theBall.y + theBall.radius >= SCREENY)
    {
      theBall.dx = 0;
      theBall.dy = 0;
      theBallHitsWall = true;
    }
    return theBallHitsWall;
  }
  
  boolean thePlayerWins()
  {
    boolean theBallHitsSide = false;
    if (theBall.y - theBall.radius <= 0  )
    {
      theBall.dx = 0;
      theBall.dy = 0;
      theBallHitsSide = true;
    }
    return theBallHitsSide;
  }
  
  void draw()
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
}
