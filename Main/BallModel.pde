class BallModel
{
  int x;
  int y;
  int size;
  int speed;
  
  int minSpeed;
  int maxSpeed;
 
  int minSize;
  int maxSize;

  boolean isBallAlive;
  boolean redBall;
  boolean blueBall;

  int colour;

  BallModel()
  {
    minSpeed = 2;
    maxSpeed = 6;
    minSize = 20;
    maxSize = 40;
   
    size = int(random(minSize, maxSize));
    x = int(random(0+(size/2), width-(size/2))); // +(size/2) for at holde den inde for skærmen
    y = 0-(size/2); //for at starte den uden for skærmen
    speed = int(random(minSpeed, maxSpeed));
    redBall = false;
    blueBall = false;
    isBallAlive = true;
    typeSelection();
  }
  BallModel(int tempSizeMax, int tempSpeedMax)// constructor used for balls as the game gets harder
  {
    minSpeed = 2;
    maxSpeed = tempSpeedMax;
    minSize = 20;
    maxSize = tempSizeMax;
    size = int(random(minSize, maxSize));
    x = int(random(0+(size/2), width-(size/2))); // +(size/2) to keep the ball inside of the screen
    y = 0-size/2; //initializes the ball outside the screen
    speed = int(random(minSpeed, maxSpeed)); 
    redBall = false;
    blueBall = false;
    isBallAlive = true;
    typeSelection();
  }

  void drawBall() // draws the ball
  {
    fill(colour);
    circle(x, y, size);
    noFill();
  }

  void moveBall() // moves the ball
  {
    y = y+speed;
  }
  void typeSelection() // selects the ball type and colour
  {
    int i = int(random(0, 11));

    if (i < 5) 
    {
      colour = #FC0320; 
      redBall = true;
    } else
    {
      colour = #0A08FC;
      blueBall = true;
    }
  }
}
