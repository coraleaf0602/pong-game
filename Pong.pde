Player thePlayer; //instance of the player class
Player theComputer;
Ball theBall;
PFont myFont;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  theComputer = new Player(MARGIN);
  theBall = new Ball();
  ellipseMode(RADIUS);
  myFont = loadFont("CourierNewPSMT-18.vlw");
  textFont(myFont);
 
}
void draw() 
{
  background(0);
  thePlayer.move(mouseX);
  theBall.move();
  theComputer.moveComputer();
  theBall.collide(thePlayer);
  theBall.collide(theComputer);
  thePlayer.theComputerWins();
  thePlayer.thePlayerWins();
  thePlayer.draw();
  theComputer.draw();
  theBall.draw();
  
  text(thePlayer.k + " : " + thePlayer.l, 230, 20);
  
   if (thePlayer.l == 3)
  {
    text("YOU WIN!", SCREENX/2, SCREENY/2);
    theComputer = new Player(MARGIN);
    theBall.dx = 0;
    theBall.dy = 0;
  }
  if (thePlayer.k == 3)
  {
    text("GAME OVER!", SCREENX/2, SCREENY/2);
    theComputer = new Player(MARGIN);
    theBall.dx = 0;
    theBall.dy = 0;
  }
} 

void mousePressed() //reset method 
{
  if (thePlayer.thePlayerWins()) 
  {
    thePlayer.l++;
  }
  if (thePlayer.theComputerWins())
  {
    thePlayer.k++;
  }
  theBall = new Ball();
  
}
