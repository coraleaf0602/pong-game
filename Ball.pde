class Ball {
  float x;
  float y;
  float dx;
  float dy;
  int radius;
  color ballColor = color(255, 200, 200);
  
  Ball()
  {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENX/4, SCREENY/2);
    dx = random(1, 2);
    dy = random(1, 2);
    radius = 5;
  }
  
  void move() 
  {
    x = x+dx;
    y = y+dy;
  }
  
  void draw()
  {
    fill(ballColor);
    
    if (x > SCREENX - radius || x < radius)
    {
      dx *= -1;
    }
    
    ellipse(int(x), int(y), radius, radius);
  }
  
  void collide(Player tp)
  {
    if( y+radius >= tp.ypos && y-radius < tp.ypos+MARGIN && x+radius >= tp.xpos && x+radius <= tp.xpos+PADDLEWIDTH )
    {
      println("collided!");
      dy = -dy;
    }
  }
}
